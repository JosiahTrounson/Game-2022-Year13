extends Node2D


func _ready():
	LiveCounter.lives=6
	LiveCounter.health = 100

func _physics_process(delta):
	
	if LiveCounter.lives == 4:
		$Live3.hide()
		
		LiveCounter.health = 100
	if LiveCounter.lives == 2:
		$Live2.hide()
		
		LiveCounter.health = 100
	if LiveCounter.lives == 0:
		get_tree().reload_current_scene()
