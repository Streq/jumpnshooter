extends Sprite
signal open_finished()
signal closed_finished()
onready var animation_player: AnimationPlayer = $AnimationPlayer

func open():
	animation_player.play("open")
	yield(animation_player,"animation_finished")
	emit_signal("open_finished")

func close():
	animation_player.play("closed")
	yield(animation_player,"animation_finished")
	emit_signal("closed_finished")
