extends Control
onready var blackout: Sprite = $blackout

onready var label: Label = $label


func trigger():
	label.visible = true
	blackout.trigger()
	yield(blackout,"finished")
	get_tree().reload_current_scene()
