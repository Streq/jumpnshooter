extends Control

onready var animation_player: AnimationPlayer = $AnimationPlayer
onready var label: Label = $label


func trigger():
	label.visible = true
	animation_player.play("default")
	yield(animation_player,"animation_finished")
	get_tree().reload_current_scene()
