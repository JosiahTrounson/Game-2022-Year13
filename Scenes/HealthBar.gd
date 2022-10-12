extends Control


func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	
#		if LiveCounter.lives ==3:
#			$ProgressBar.value = 100
#		if LiveCounter.lives ==2:
#			$ProgressBar.value = 66
#		if LiveCounter.lives ==1:
#			$ProgressBar.value = 33

		$ProgressBar.value = LiveCounter.health
