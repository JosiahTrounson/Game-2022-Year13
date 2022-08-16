extends Area2D

var speed = 75

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_Bullet_body_entered(body):
	if body.is_in_group("player"):
		body.queue_free()
	queue_free()
