extends Area2D

onready var dialog: VBoxContainer = $"../HUD/dialog"
onready var boss_fight_start: AnimationPlayer = $boss_fight_start



func _on_boss_area_area_entered(area: Area2D) -> void:
	dialog.say(TextRequest.new("Bueno nada ahora vas a pelear contra un bebe gigante"))
	boss_fight_start.play("start")
	collision_mask = 0
