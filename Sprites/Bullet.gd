extends Area2D
class_name Bullet

export (int) var speed = 10

enum state {FIRE}

onready var player_state = state.FIRE

onready var kill_timer = $KillTimer



var direction := Vector2.ZERO


func _ready():
	kill_timer.start()
	


func _physics_process(delta: float):
	if direction != Vector2.ZERO:
		var velocity = direction * speed

		global_position += velocity

func set_direction(direction: Vector2):
	self.direction = direction


func _on_KillTimer_timeout():
	queue_free()


func _on_Bullet_body_entered(body: Node):
	if body.has_method("handle_hit"):
		body.handle_hit()
		queue_free()
