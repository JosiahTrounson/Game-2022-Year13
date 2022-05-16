extends KinematicBody2D

export (int) var speed = 120

var velocity = Vector2.ZERO

export (float) var acceleration = 25

enum state {IDLE, STRAIGHT, EXPLOSION, LEFT, RIGHT}

onready var player_state = state.STRAIGHT


func _ready():
	$AnimationPlayer.play("Straight")
	pass 

func update_animation(anim):
	$AnimationPlayer.play(anim)
	
func handle_state(state):
	print(state)
	pass
	
func get_input():
	var dir = Input.get_action_strength("right") - Input.get_action_strength("left")
	if dir != 0:
		velocity.x = move_toward(velocity.x, dir*speed, acceleration)
		
func _physics_process(delta):
	get_input()
	if velocity == Vector2.ZERO:
		player_state = state.IDLE
	elif velocity.x != 0:
		player_state = state.STRAIGHT
		
	handle_state(player_state)
	update_animation(player_state)	
	
