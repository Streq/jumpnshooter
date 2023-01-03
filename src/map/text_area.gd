extends Area2D
signal triggered()

func _on_area_entered(area: Area2D) -> void:
	collision_mask = 0
	emit_signal("triggered")
