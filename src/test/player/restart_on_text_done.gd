extends Node


func trigger():
	yield(get_parent().dialog, "display_finished")
	get_tree().reload_current_scene()
