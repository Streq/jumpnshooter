extends Control

onready var icon = $icon
onready var show_timer = $icon/show_timer
onready var hide_timer = $icon/hide_timer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_textbox_panel_finished():
	show()
	icon.show()
	hide_timer.start()


func _on_textbox_panel_started():
	hide()
	hide_timer.stop()
	show_timer.stop()
