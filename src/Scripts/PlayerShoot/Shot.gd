extends Node2D

export var bullet_speed = 2000
export var fire_rate = 0.2

var bullet = preload("res://src/Scenes/Bullets/Bullet-1.tscn")
var can_fire = true

func _process(_delta):
	if Input.is_action_pressed("FireUp") and can_fire:
		var bullet_instance = bullet.instance()
		bullet_instance.position = $ShootPoint.get_global_position()
		bullet_instance.apply_impulse(Vector2(),Vector2(0,-bullet_speed))
		get_tree().get_root().add_child(bullet_instance)
		can_fire = false
		yield(get_tree().create_timer(fire_rate),"timeout")
		can_fire = true 
	elif Input.is_action_pressed("FireLeft") and can_fire:
		var bullet_instance = bullet.instance()
		bullet_instance.position = $ShootPoint.get_global_position()
		bullet_instance.rotation_degrees = -90
		bullet_instance.apply_impulse(Vector2(),Vector2(-bullet_speed,0))
		get_tree().get_root().add_child(bullet_instance)
		can_fire = false
		yield(get_tree().create_timer(fire_rate),"timeout")
		can_fire = true 
	elif Input.is_action_pressed("FireRight") and can_fire:
		var bullet_instance = bullet.instance()
		bullet_instance.position = $ShootPoint.get_global_position()
		bullet_instance.rotation_degrees = 90
		bullet_instance.apply_impulse(Vector2(),Vector2(bullet_speed,0))
		get_tree().get_root().add_child(bullet_instance)
		can_fire = false
		yield(get_tree().create_timer(fire_rate),"timeout")
		can_fire = true 
