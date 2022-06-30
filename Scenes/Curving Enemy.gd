extends KinematicBody2D

var direction = Vector2.ZERO
onready var player = get_tree().get_nodes_in_group("Player")[0]
var rotation_speed = 1
var speed = 10
var velocity = Vector2.ZERO

func _ready():
	pass

func _process(delta):
#	var angle_to_plane = get_angle_to(player.global_position)
#	rotation = move_toward(rotation,angle_to_plane,rotation_speed * delta)
#	velocity = transform.x * speed
#	move_and_slide(velocity)
	translate(Vector2.DOWN * speed * delta)
	position.x += cos(position.y * 0.5 * delta)
	position.y += sin(position.x * delta)
