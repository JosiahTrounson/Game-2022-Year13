extends Node2D


export (int) var health = 100 setget set_health
export (int) var playerhealth = 100 setget set_health

func set_health(new_health: int):
	
	print(new_health)
	health = clamp(new_health, 0, 100)


