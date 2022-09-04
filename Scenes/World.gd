extends Node2D


onready var bullet_manager = $BulletManager
onready var player = $BulletManager

func _enter_tree():
	if Checkpoint.LastPosition:
		$Player.global_position=Checkpoint.LastPosition

# Called when the node enters the scene tree for the first time.
func _ready():
	player.connect("player_fired_bullet", bullet_manager, "handle_bullet_spawned")

