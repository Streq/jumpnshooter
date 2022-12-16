extends Area2D

func _physics_process(delta: float) -> void:
	for area in get_overlapping_areas():
		_on_hitbox_area_entered(area)

func _on_hitbox_area_entered(area: Area2D) -> void:
	var player = area.owner
	if !player.invulnerable:
		player.get_hurt()
