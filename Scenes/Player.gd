extends KinematicBody2D

export (int) var speed = 120

var velocity = Vector2.ZERO

export (float) var acceleration = 25

enum state {IDLE, STRAIGHT, EXPLOSION, LEFT, RIGHT}


func _ready():
	$AnimationPlayer.play("Straight")
	pass 

