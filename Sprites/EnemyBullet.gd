extends Area2D

var move = Vector2.ZERO
var look_vec = Vector2.ZERO
var player = null
var speed = 50

func _ready():
	pass
	#look_vec = player.global_position - global_position
	
	
func _physics_process(delta):
	position += transform.x * speed * delta
#	move = Vector2.ZERO
#
#	move = move.move_toward(look_vec, delta)
#	move = move.normalized() * speed
#	position += move

#func _on_Bullet_body_entered(body):
#	if body.is_in_group("player"):
#		body.queue_free()
#	queue_free()

#func _on_Bullet_body_entered(body: Node):
#	if body.has_method("player_hit"):
#		body.player_hit()
#		queue_free()
#
		
func _on_PlayerKillTimer_timeout():
	queue_free()


func _on_EnemyBullet_body_entered(body: Node):
	if body.has_method("player_hit"):
		body.player_hit()
		queue_free()
	
