extends Node2D

var phases=[3,5,7]
var time = 1
var enemy = preload("res://src/Scenes/Enemies/EnemyLv1.tscn")
var now = 0
var totalSpawneds = 0

func _physics_process(delta):
	if time < 1:
		time+=delta
	else:
		time = 0
		if totalSpawneds<phases[now]:
			var spawned = enemy.instance()
			spawned.position=Vector2(450,0)
			get_parent().call_deferred("add_child",spawned)
			totalSpawneds+=1
