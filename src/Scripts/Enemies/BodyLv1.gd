extends KinematicBody2D

export var maxHealth = 1
export var InvencTime = 0.2
var actualHealth = maxHealth
var damaged = false

var speed = 200
var move = Vector2()
var status = 1
var bullet = preload("res://src/Scenes/Enemies/enemyShot.tscn")
var reload = 3
var bulletSpeed=400

func _physics_process(delta):
	var location = [position.x,position.y]
	if location[0]>-450 and status == 1:
		move.x=-10
		move.y=8
	elif status == 1:
		status = 2
		
	if location[0]<0 and status == 2:
		move.x=10
		move.y=0
	elif status==2:
		status = 3
		
	if location[0]>-450 and status == 3:
		move.x=-10
		move.y=-8
	elif status==3:
		status = 4
		
	if location[0]<0 and status == 4:
		move.x=10
		move.y=0
	elif status==4:
		status = 1
	move_and_slide(move.normalized()*speed)
	
	if reload>0:
		reload-=delta
	else:
		reload=3
		var bulletShooted = bullet.instance()
		bulletShooted.position = Vector2(position.x+450,position.y+20)
		bulletShooted.get_node("EnemyShotBody").apply_impulse(Vector2(),Vector2(0,bulletSpeed))
		get_tree().get_root().add_child(bulletShooted)
	
func _on_HurtBox_body_entered(body):
	if body.is_in_group("Damage"):
		print("Dano Inimigo")
		if actualHealth > 0:
			if !damaged:
				dano()
		else:
			die()

func dano():
	print("tomou dano")
	damaged = true
	actualHealth = actualHealth-1
	yield(get_tree().create_timer(InvencTime),"timeout")
	damaged = false

func die():
	print("morreu")
	queue_free()
