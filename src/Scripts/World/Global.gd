extends Node
var kills = 0
func enemieDeath():
	kills += 1
func returnKills():
	return kills
func zeroKills():
	kills = 0
