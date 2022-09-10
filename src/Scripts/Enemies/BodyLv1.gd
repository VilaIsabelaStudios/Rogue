extends KinematicBody2D

var speed = 200
var move = Vector2()
var status = 1

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
	
