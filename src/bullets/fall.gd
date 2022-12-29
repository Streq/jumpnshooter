extends Node
export var gravity := 100.0

func _physics_process(delta: float) -> void:
	get_parent().velocity.y += gravity*delta
	pass
