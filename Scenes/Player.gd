extends KinematicBody2D

export (int) var speed = 240

var velocity = Vector2.ZERO

export (float) var acceleration = 75

enum state {IDLE, STRAIGHT, BACKWARDS, EXPLOSION, LEFT, RIGHT}

onready var player_state = state.STRAIGHT


func _ready():
	$AnimationPlayer.play("Straight")
	pass 

func update_animation(anim):
	match anim:
		state.STRAIGHT:
			$AnimationPlayer.play("Straight")
		state.BACKWARDS:
			$AnimationPlayer.play("Backwards")
		state.RIGHT:
			$AnimationPlayer.play("Right")
		state.LEFT:
			$AnimationPlayer.play("Left")
		state.EXPLOSION:
			$AnimationPlayer.play("Explosion")
	
func handle_state(player_state):
	match(player_state):
		state.STRAIGHT:
			velocity.y = move_toward(velocity.y, 0, acceleration)
	pass
	
func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed('right'):
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1
	# Make sure diagonal movement isn't faster
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	if velocity == Vector2.ZERO:
		player_state = state.STRAIGHT
	if Input.is_action_just_pressed("right"):
		player_state = state.RIGHT
	elif velocity.x != 0:
		player_state = state.STRAIGHT
	
	#var dir = Input.get_action_strength("right") - Input.get_action_strength("left")
	#if dir != 0:
		#velocity.x = move_toward(velocity.x, dir*speed, acceleration)
	#else:
		#velocity.x = move_toward(velocity.x, 0,acceleration)
	#dir = Input.get_action_strength("up") - Input.get_action_strength("down")
	#if dir != 0:
		#velocity.y = move_toward(velocity.y, dir*speed, acceleration)
	#else:
	#	velocity.y = move_toward(velocity.y, 0, acceleration)
	#print(velocity)
		
#func _physics_process(delta):
	#get_input()
	#if velocity == Vector2.ZERO:
#		player_state = state.IDLE
#	elif velocity.x != 0:
#		player_state = state.STRAIGHT
#	elif velocity.x != 0:
#		player_state = state.RIGHT
#	elif velocity.x != 0:
#		player_state = state.LEFT
#	elif velocity.y != 0:
#		player_state = state.STRAIGHT
#	elif velocity.y != 0:
#		player_state = state.BACKWARDS

		
#	handle_state(player_state)
#	update_animation(player_state)	
#
#	velocity = move_and_slide(velocity,)
#
