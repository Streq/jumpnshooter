extends CharacterState
onready var target_sight: Area2D = $"../../pivot/target_sight"

func _physics_update(delta: float) -> void:
	if target_sight.get_overlapping_areas():
		goto("shoot")
