extends Node

# Number of killed enemies
var kills = 0

# Number of kills on actualHorde
var killsOnHorde = 0

# Actual horde of player, reutilized avery phase
var actualHorde = 0



func enemieDeath():
	kills += 1
	killsOnHorde+=1
func returnKills():
	return kills
func returnKillsOnOrder():
	return killsOnHorde
func zeroKills():
	kills = 0

func nextHorde():
	actualHorde+=1
	killsOnHorde = 0
func returnHorde():
	return actualHorde
func zeroHorde():
	actualHorde = 0
	
