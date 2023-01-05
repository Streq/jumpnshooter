extends Node


export var GUN : PackedScene

func trigger(target):
	target.get_node("guns").add_gun(GUN.instance())
