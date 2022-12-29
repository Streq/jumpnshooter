extends Node2D


func spawn():
	var i = randi()%get_child_count()
	return get_child(i).spawn()

func _ready() -> void:
	for child in get_children():
		child.owner = self
