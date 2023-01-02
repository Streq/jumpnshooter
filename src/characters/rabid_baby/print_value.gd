extends Node


func _physics_process(delta: float) -> void:
	print(get_parent().value)
