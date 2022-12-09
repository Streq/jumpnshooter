extends Node


var map = {}

func _ready():
	for child in get_children():
		map[child.name] = child
