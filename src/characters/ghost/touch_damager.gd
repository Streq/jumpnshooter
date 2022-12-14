extends Node2D
signal hit()
export var disabled := false


func _on_hitbox_area_entered(area: Area2D) -> void:
	if disabled:
		return
	var target = area.owner
	if target.team == owner.team or target.pass_through:
		return
	area.owner._on_hit(self)
	emit_signal("hit")
