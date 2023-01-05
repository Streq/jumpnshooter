extends Node2D
signal picked_up(by)
signal triggered

func pick_up(by):
	emit_signal("picked_up", by)
	emit_signal("triggered")
	queue_free()
