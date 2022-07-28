extends Sprite

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
	#move_and_slide(transform.x * speed,Vector2.ZERO)

func turn(player):


var direction = get_global_player_position()
var aim_speed = deg2rad(1)
if $Tank_gun.get_angle_to(m) > 0:
	$Tank_gun.rotation += aim_speed
else:
	$Tank_gun.rotation -= aim_speed

func turn(player):
	var global_pos = global_transform.origin
	var player_pos = player.global_transform.origin
	var rotation_speed = 0.01
	var wtransform = global_transform.looking_at(Vector3(player_pos.x,global_pos.y,player_pos.z),Vector3(0,1,0))
	var wrotation = Quat(global_transform.basis).slerp(Quat(wtransform.basis), rotation_speed)

	global_transform = Transform(Basis(wrotation), global_transform.origin)


func _process(delta):
	slow_rotate(rotation_speed * delta)
