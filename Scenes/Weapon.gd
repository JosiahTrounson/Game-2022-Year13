extends Node2D

signal weapon_fired(bullet, location, direction)

export (PackedScene) var Bullet

onready var end_of_gun = $EndOfGun
onready var end_of_gun2 = $EndOfGun2
onready var attack_cooldown = $AttackCooldown

func shoot():
	if attack_cooldown.is_stopped() and Bullet != null:
		var bullet_instance = Bullet.instance()
		get_parent().add_child(bullet_instance)
		bullet_instance.global_position = end_of_gun.global_position
		bullet_instance.set_direction(Vector2.UP)
		attack_cooldown.start()
	
		bullet_instance = Bullet.instance()
		get_parent().add_child(bullet_instance)
		bullet_instance.global_position = end_of_gun2.global_position
		bullet_instance.set_direction(Vector2.UP)
		emit_signal("weapon_fired", bullet_instance)
		print("Shot!")
	else:
		pass
