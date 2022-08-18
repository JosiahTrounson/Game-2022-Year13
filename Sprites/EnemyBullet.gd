extends Area2D

var move = Vector2.ZERO
var look_vec = Vector2.ZERO
var player = null
var speed = 5

func _ready():
	
	look_vec = player.position - global_position
	
func _physics_process(delta):
	move = Vector2.ZERO
	
	move = move.move_toward(look_vec, delta)
	move = move.normalized() * speed
	position += move

#func _on_Bullet_body_entered(body):
#	if body.is_in_group("player"):
#		body.queue_free()
#	queue_free()