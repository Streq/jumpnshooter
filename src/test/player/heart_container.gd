extends TextureRect
onready var animation_player: AnimationPlayer = $AnimationPlayer

func on():
	animation_player.play("on")

func off():
	animation_player.play("off")
