extends VBoxContainer
signal display_started()
signal display_finished()


onready var textbox = $textbox
onready var profile = $profile

var queue = []

func say(request:TextRequest):
	if queue.empty():
		execute_dialog(request)
	queue.append(request)
func _ready() -> void:
	hide()

func _on_textbox_text_started():
	show()
	pause()
	emit_signal("display_started")
func _on_textbox_text_finished():
	hide()
	queue.remove(0)
	if !queue.empty():
		execute_dialog(queue[0])
	else:
		yield(unpause(), "completed")
		emit_signal("display_finished")
	
func execute_dialog(request:TextRequest):
	profile.change_profile(request)
	textbox.say(request)
func pause():
	get_tree().paused = true
func unpause():
	for i in 2: #prevent jump after dialog end
		yield(get_tree(),"physics_frame")
	get_tree().paused = false
