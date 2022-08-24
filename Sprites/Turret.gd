extends Sprite

var direction = Vector2.ZERO
onready var player = get_tree().get_nodes_in_group("Player")[0]
export var rotation_speed = 1
export var speed = 10
var velocity = Vector2.ZERO
export (bool) var random_movement = false
onready var ENEMY_BULLET = preload("res://Godot/Game/Game-2022-Year13/Sprites/EnemyBullet.tscn")

onready var end_of_turret = $EndOfTurret

func _ready():
	
	direction = (player.global_position - global_position).normalized()

func slow_rotate(rotate_speed):
	direction = (player.global_position - global_position).normalized()
	global_rotation = lerp_angle(global_rotation, direction.angle(), rotate_speed )
	#move_and_slide(transform.x * speed,Vector2.ZERO)

func turn(player,delta):


	var target_direction = player.global_position
	var aim_speed = deg2rad(45)
	print(get_angle_to(target_direction))
	if get_angle_to(target_direction) > deg2rad(1):
		rotation += aim_speed  *delta
	elif get_angle_to(target_direction)< deg2rad(-1):
		rotation -= aim_speed *delta


func fire():
	var enemybullet_instance = ENEMY_BULLET.instance()
	enemybullet_instance.player = player
	get_node("/root/World").add_child(enemybullet_instance)
	enemybullet_instance.position = get_global_position()

	$Timer.set_wait_time(1)
	enemybullet_instance.global_position = end_of_turret.global_position
	enemybullet_instance.rotation_degrees = global_rotation_degrees
	
func _on_Timer_timeout():
	if player != null:
		fire()

#func turn(player):
#	var global_pos = global_transform.origin
#	var player_pos = player.global_transform.origin
#	var rotation_speed = 0.01
#	var wtransform = global_transform.looking_at(Vector3(player_pos.x,global_pos.y,player_pos.z),Vector3(0,1,0))
#	var wrotation = Quat(global_transform.basis).slerp(Quat(wtransform.basis), rotation_speed)
#
#	global_transform = Transform(Basis(wrotation), global_transform.origin)


func _process(delta):
	turn(player,delta)
	#slow_rotate(rotation_speed * delta)


func _on_PlayerDetectionZone_body_entered(body):
	if body.is_in_group("Player"):
		$Timer.start()


func _on_PlayerDetectionZone_body_exited(body):
	if body.is_in_group("Player"):
		$Timer.stop()


#func _on_Timer_timeout():
#	#shoot code here
#	pass
