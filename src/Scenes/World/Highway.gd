extends Node2D

# Number of enemies for each horde
var hordes=[2,3,4,5,6]
# Possible position (x) to spawn an enemy
var possiblePositions = [60,135,230,325,420]
# Time to wait for spawn another enemy
var time = 1
# Scene of enemy type 1
var enemy = preload("res://src/Scenes/Enemies/EnemyLv1.tscn")
# Number of spawned enemies of actual horde
var spawneds = 0

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
		Global.nextHorde()
		actualHorde = Global.returnHorde()
		spawneds = 0
	# Time updated
	if time < 1:
		time+=delta
	# Time out
	else:
		time = 0
		# Spawn only until the number defined in horde
	if spawneds<hordes[actualHorde]:
		var spawned = enemy.instance()
		spawned.position=Vector2(possiblePositions[spawneds],0)
		get_parent().call_deferred("add_child",spawned)
		spawneds+=1
