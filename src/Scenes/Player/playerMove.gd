extends KinematicBody2D

var vel = Vector2()
var move_speed = 450

func _physics_process(delta):
	vel.x = 0
	vel.y = 0
	
	if Input.is_action_pressed("ui_right"):
		vel.x = vel.x + move_speed
	if Input.is_action_pressed("ui_left"):
		vel.x = vel.x - move_speed
	if Input.is_action_pressed("ui_up"):
		vel.y = vel.y - move_speed
	if Input.is_action_pressed("ui_down"):
		vel.y = vel.y + move_speed

	
	move_and_slide(vel)
