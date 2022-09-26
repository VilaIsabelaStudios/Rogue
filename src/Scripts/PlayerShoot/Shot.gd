extends Node2D

export var weapon = 0
export var bullet_speed = 2000
export var fire_rate = 0.2
export var total_Ammo = 5
var current_Ammo = total_Ammo
export var reload = false
export var reloadTime = 1

var bullet = preload("res://src/Scenes/Bullets/Bullet-1.tscn")
var can_fire = true

func _process(_delta):
	if !reload:
		if can_fire and (Input.is_action_pressed("FireUp") or Input.is_action_pressed("FireRight") or Input.is_action_pressed("FireLeft")):
			current_Ammo -=1
			var direc = Vector2()
			var bullet_instance = bullet.instance()
			if Input.is_action_pressed("FireUp") and can_fire:
				direc = Vector2(0,-bullet_speed)
			elif Input.is_action_pressed("FireLeft") and can_fire:
				bullet_instance.rotation_degrees = -90
				direc = Vector2(-bullet_speed,0)
			elif Input.is_action_pressed("FireRight") and can_fire:
				bullet_instance.rotation_degrees = 90
				direc = Vector2(bullet_speed,0)
			bullet_instance.apply_impulse(Vector2(),direc)
			bullet_instance.position = $ShootPoint.get_global_position()
			get_tree().get_root().add_child(bullet_instance)
			can_fire = false
			print(current_Ammo," bullets")
			yield(get_tree().create_timer(fire_rate),"timeout")
			if(current_Ammo<=0):
				reload = true
			can_fire = true 
	else:
		current_Ammo = total_Ammo
		yield(get_tree().create_timer(reloadTime),"timeout")
		reload = false
		

