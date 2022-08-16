extends KinematicBody2D

onready var health_stat = $Health

func handle_hit():
	health_stat.health -= 20
	if health_stat.health <= 0:
		queue_free()

#func _ready():
#	pass 

var direction = Vector2.ZERO
onready var player = get_tree().get_nodes_in_group("Player")[0]
export var rotation_speed = 0.25
export var speed = 10
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
