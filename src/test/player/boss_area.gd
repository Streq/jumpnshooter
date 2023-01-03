extends Area2D

onready var dialog: VBoxContainer = $"../HUD/dialog"
onready var boss_fight_start: AnimationPlayer = $boss_fight_start



func _on_boss_area_area_entered(area: Area2D) -> void:
	emit_signal("triggered")
	collision_mask = 0
