extends RigidBody2D

var damage = 1

func _on_EnemyShotBody_body_entered(body):
	if body.is_in_group("Damageble"):
		print("asdasdasda")
		body.damage(damage)
		get_parent().queue_free()
