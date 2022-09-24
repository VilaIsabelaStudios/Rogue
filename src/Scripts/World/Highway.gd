extends Node2D

# Number of enemies for each horde
var hordes=[2,3,4,5,6]
# Possible position (x) to spawn an enemy
var possiblePositions = [60,135,230,325,420,95,190]
# Time to wait for spawn another enemy
var pause = 0
# Scene of enemy type 1
var enemy = preload("res://src/Scenes/Enemies/EnemyLv1.tscn")
# Number of spawned enemies of actual horde
var spawneds = 0
# Import animation for horde cleared
onready var animation = $AnimationPlayer

# Accessing Global vars
var actualHorde = Global.returnHorde()
var killeds = Global.returnKills()
var killedsOnHorde = Global.returnKillsOnOrder()
func _physics_process(delta):
	# Updating with Global vars
	actualHorde = Global.returnHorde()
	killeds = Global.returnKills()
	killedsOnHorde = Global.returnKillsOnOrder()	
	# Change of horde
	if killedsOnHorde == hordes[actualHorde]:
		if pause == 0:
			animation.play("onHordeCleared")
		#pause between two hordes
		# Time updated
		if pause < 3:
			pause+=delta
		# Time out
		else:
			pause = 0
			Global.nextHorde()
			actualHorde = Global.returnHorde()
			spawneds = 0
	
	# Spawn only until the number defined in horde
	if spawneds<hordes[actualHorde]:
		var spawned = enemy.instance()
		spawned.position=Vector2(possiblePositions[spawneds],0)
		get_parent().call_deferred("add_child",spawned)
		spawneds+=1
