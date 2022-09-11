extends RigidBody2D


func _on_Bullet1_body_entered(body):
	if !body.is_in_group("Player"):
		queue_free()
