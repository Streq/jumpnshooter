extends Node


func _physics_process(delta: float) -> void:
	var input_state = get_parent().input_state
	input_state.A.pressed = Input.is_action_pressed("A")
	input_state.B.pressed = Input.is_action_pressed("B")
	input_state.L.pressed = Input.is_action_pressed("L")
	input_state.R.pressed = Input.is_action_pressed("R")
	input_state.dir = Input.get_vector("ui_left","ui_right","ui_up","ui_down")

