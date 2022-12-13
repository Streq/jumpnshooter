extends Node2D
onready var target_detect: Area2D = $target_detect

func _physics_process(delta: float) -> void:
	var targets = target_detect.get_overlapping_areas()
	var input_state = get_parent().input_state
	input_state.dir.x = 0
	if targets:
		input_state.dir.x = sign(targets[0].global_position.x - global_position.x)
	
