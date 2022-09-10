extends Node2D

var time = 6
var enemy = preload("res://src/Scenes/Enemies/EnemyLv1.tscn")

func _physics_process(delta):
	if time < 6:
		time+=delta
	else:
		time = 0
		var spawned = enemy.instance()
		spawned.position=Vector2(450,0)
		get_parent().call_deferred("add_child",spawned)
		
	
