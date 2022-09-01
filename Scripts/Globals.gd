extends Node

var enemies_killed 0

func restart_game():
	enemies_killed = 0
	get_tree().reload_current_scene()
