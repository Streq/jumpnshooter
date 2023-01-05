extends Node2D
signal triggered(spawned_item)
export var PICKUP : PackedScene


func trigger():
	var pickup = PICKUP.instance()
	var parent = get_parent()
	parent.get_parent().add_child(pickup)
	pickup.global_position = global_position
	emit_signal("triggered", pickup)
