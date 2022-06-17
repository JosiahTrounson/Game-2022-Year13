extends Area2D
class_name Bullet

export (int) var speed = 10


onready var kill_timer = $KillTimer


var direction := Vector2.ZERO


func _ready():
	kill_timer.start()


func _physics_process(delta: float):
	if direction != Vector2.ZERO:
		var velocity = direction * speed

		global_position += velocity
# Called when the node enters the scene tree for the first time.

func set_direction(direction: Vector2):
	self.direction = direction

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_KillTimer_timeout():
	queue_free()
