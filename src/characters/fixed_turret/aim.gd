extends Node2D

onready var target_sight: Area2D = $"../target_sight"

func _physics_process(delta: float) -> void:
	
	var targets = target_sight.get_overlapping_areas()
	if !targets:
		return
	
	var target = targets[0].global_position
	
	look_at(target)
