extends KinematicBody2D

export (int) var speed = 120

func _ready():
	$AnimationPlayer.play("Straight")
	pass 

