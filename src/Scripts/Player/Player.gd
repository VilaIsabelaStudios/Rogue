extends Node2D

export var maxHealth = 1
export var InvencTime = 0.2
var actualHealth = maxHealth
var damaged = false

func _on_HurtBox_body_entered(body):
	if body.is_in_group("Damage"):
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

