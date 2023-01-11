extends Node2D
signal exit(to)
func exit(to,spawn_point):
	emit_signal("exit",to,spawn_point)
	get_tree().change_scene(to)
