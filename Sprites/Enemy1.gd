extends KinematicBody2D

onready var anim_death = $EnemyAnimation
onready var health_stat = $Health
enum state {Explosion}
onready var anim_tree = $AnimationTree.get("parameters/playback")
			
func handle_hit():
	health_stat.health -= 20
	if health_stat.health <= 0:
#		enemy_dead = true
#		$EnemyAnimation.play("explosion")
#		anim_tree.travel("Explosion")
#		yield($AnimationPlayer,"animation_finished")
		
#		yield($CollisionShape2D/AnimatedSprite,"animation_explosion")
		queue_free()


#func _ready():
#	pass 

var enemy_dead = false

var direction = Vector2.ZERO
onready var player = get_tree().get_nodes_in_group("Player")[0]
export var rotation_speed = 0.25
export var speed = 10
var velocity = Vector2.ZERO
export (bool) var random_movement = false
func _ready():
	
	direction = (player.global_position - global_position).normalized()

#func _on_enemy_area_entered(area):
#	if area.is_in_group("bullet"):
#		enemy_dead = true
#		$EnemyAnimation.play("death")

func slow_rotate(rotate_speed):

	direction = (player.global_position - global_position).normalized()
	global_rotation = lerp_angle(global_rotation, direction.angle(), rotate_speed )
	move_and_slide(transform.x * speed,Vector2.ZERO)
	
	
func _process(delta):
	slow_rotate(rotation_speed * delta)

	if random_movement:
		position.x += cos(position.y * 0.5 * delta)
		position.y += sin(position.x * delta)
