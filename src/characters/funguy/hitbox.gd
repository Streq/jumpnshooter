extends Area2D

func _physics_process(delta: float) -> void:
	for area in get_overlapping_areas():
		emit_signal("area_entered", area)
