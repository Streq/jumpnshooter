extends Area2D



func _on_target_complete_area_entered(area: Area2D) -> void:
	Textbox.say(TextRequest.new("Area completeda, teletransportandose a la base madre",null,null))
	pass
