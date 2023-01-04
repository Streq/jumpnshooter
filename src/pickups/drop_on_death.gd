extends Node

export var PICKUP : PackedScene


func trigger():
	var pickup = PICKUP.instance()
	var parent = get_parent()
	parent.get_parent().add_child(pickup)
	pickup.global_position = parent.global_position
