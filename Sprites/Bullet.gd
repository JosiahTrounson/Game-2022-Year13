extends Area2D


export (int) var speed = 10


var direction := Vector2.ZERO


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
