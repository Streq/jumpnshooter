extends Area2D

onready var dialog: VBoxContainer = $"../HUD/dialog"


func _on_target_complete_area_entered(area: Area2D) -> void:
#	Textbox.say(TextRequest.new("Area completeda, teletransportandose a la base madre"))
	
	dialog.say(TextRequest.new("Area completeda, teletransportandose a la base madre"))
	
	pass
