extends RigidBody2D


func _on_Bullet1_body_entered(body):
	print("atirou")
	if body.is_in_group("Player"):
		queue_free()
