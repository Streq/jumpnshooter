extends Node

export var BANG : PackedScene

func trigger():
	var bang = BANG.instance()
	owner.get_parent().add_child(bang)
	bang.global_position = owner.global_position
