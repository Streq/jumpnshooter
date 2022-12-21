extends VBoxContainer
signal display_started()
signal display_finished()


onready var textbox = $textbox
onready var profile = $profile

func say(request:TextRequest):
	if request.pause:
		get_tree().paused = true
	show()
	profile.change_profile(request)
	textbox.say(request)
	
	if request.pause:
		yield(self,"display_finished")
		get_tree().paused = false
func _ready() -> void:
	hide()

func _on_textbox_text_started():
	show()
	emit_signal("display_started")
func _on_textbox_text_finished():
	hide()
	emit_signal("display_finished")
