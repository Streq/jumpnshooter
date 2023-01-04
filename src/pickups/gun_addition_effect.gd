extends Node


export var GUN : PackedScene

func trigger(area):
	var target = area.get_parent()
	target.get_node("guns").add_gun(GUN.instance())
