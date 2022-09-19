extends Node2D

export var maxHealth = 3
export var InvencTime = 0.2
var actualHealth = maxHealth
var damaged = false

func damage(var damage):
		actualHealth = actualHealth-1
		print("tomou dano")
		print(actualHealth)
		if actualHealth <=0:
			die()
		damaged = true
		yield(get_tree().create_timer(InvencTime),"timeout")
		damaged = false

func die():
	print("morreu")
	queue_free()

