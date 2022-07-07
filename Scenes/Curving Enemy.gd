extends KinematicBody2D

var direction = Vector2.ZERO
onready var player = get_tree().get_nodes_in_group("Player")[0]
export var rotation_speed = 10
export var speed = 100
var velocity = Vector2.ZERO
export (bool) var random_movement = false
func _ready():
	
	direction = (player.global_position - global_position).normalized()

func slow_rotate(rotate_speed):
	direction = (player.global_position - global_position).normalized()
	global_rotation = lerp_angle(global_rotation, direction.angle(), rotate_speed )
	move_and_slide(transform.x * speed,Vector2.ZERO)
	
	
func _process(delta):
	slow_rotate(rotation_speed * delta)

	if random_movement:
		position.x += cos(position.y * 0.5 * delta)
		position.y += sin(position.x * delta)
