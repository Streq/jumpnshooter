extends VBoxContainer
signal display_started()
signal display_finished()


onready var textbox = $textbox
onready var profile = $profile

func say(request:TextRequest):
	profile.change_profile(request)
	textbox.say(request)
func _ready() -> void:
	hide()

func _on_textbox_text_started():
	show()
	pause()
	emit_signal("display_started")
func _on_textbox_text_finished():
	hide()
	yield(unpause(), "completed")
	emit_signal("display_finished")


func pause():
	get_tree().paused = true
func unpause():
	for i in 2: #prevent jump after dialog end
		yield(get_tree(),"physics_frame")
	get_tree().paused = false
