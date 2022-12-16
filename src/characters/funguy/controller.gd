extends Node2D
onready var target_detect: Area2D = $target_detect

var target = null

func _physics_process(delta: float) -> void:
	var targets = target_detect.get_overlapping_areas()
	target = targets[0] if targets else target
	
	var input_state = get_parent().input_state
	input_state.dir.x = 0
	if target:
		input_state.dir.x = sign(target.global_position.x - global_position.x)
	
