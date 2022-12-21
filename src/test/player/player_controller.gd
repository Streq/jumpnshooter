extends Node


func _physics_process(delta: float) -> void:
	var input_state = get_parent().input_state
	input_state.copy_from(Controller.input_state)

