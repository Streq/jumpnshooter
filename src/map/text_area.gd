extends Area2D
signal triggered()
export (String, MULTILINE) var text = ""
onready var dialog: VBoxContainer = $"../HUD/dialog"

func _on_boss_area_area_entered(area: Area2D) -> void:
	dialog.say(TextRequest.new(text))
	collision_mask = 0
	emit_signal("triggered")
