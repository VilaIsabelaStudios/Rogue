extends Area2D

var damage = 1

func _on_Bullet_area_body_entered(body):
	if body.is_in_group("Damageble"):
		body.get_parent().damage(damage)
		get_parent().queue_free()
