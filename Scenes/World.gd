extends Node2D

onready var bullet_manager = $BulletManager
onready var player = $BulletManager

#func _enter_tree():
#
#	if(Globals.lifeLevel <= 0):
#		get_tree().change_scene("res://Godot/Game/Game-2022-Year13/Scripts/SavePoint.tscn")
#	$Player.PlayerLife=Globals.life
#	if Checkpoint.LastPosition:
#		$Player.global_position=Checkpoint.LastPosition

# Called when the node enters the scene tree for the first time.
func _ready():
	player.connect("player_fired_bullet", bullet_manager, "handle_bullet_spawned")

func _process(delta):
	pass
	if Input.is_action_just_pressed("reset"):
		GameStats.reset()
