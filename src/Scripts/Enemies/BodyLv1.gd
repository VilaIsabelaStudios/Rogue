extends KinematicBody2D

export var maxHealth = 1
export var InvencTime = 0.2
var actualHealth = maxHealth
var damaged = false

var speed = 130
var move = Vector2()
var bullet = preload("res://src/Scenes/Enemies/enemyShot.tscn")
var reload = 3
var bulletSpeed=400

func _physics_process(delta):
	var location = [global_position.x,global_position.y]
	if location[1]<400:
		move.y=1
	else: 
		move.y=0
	move_and_slide(move.normalized()*speed)
	# Decrease time to shot again
	if reload>0:
		reload-=delta
	# Spawn of a shot
	else:
		reload=3
		var bulletShooted = bullet.instance()
		bulletShooted.position = Vector2(location[0],location[1]+16)
		bulletShooted.get_node("EnemyShotBody").apply_impulse(Vector2(),Vector2(0,bulletSpeed))
		get_tree().get_root().add_child(bulletShooted)
		
func damage(var damage):
	if !damaged:
		actualHealth = actualHealth-1
		print("tomou dano")
		print(actualHealth)
		if actualHealth <=0:
			die()
		damaged = true
		yield(get_tree().create_timer(InvencTime),"timeout")
		damaged = false

func die():
	print("morreu")
	# Kills increased
	Global.enemieDeath()
	queue_free()
