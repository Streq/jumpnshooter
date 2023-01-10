extends Node2D
var map = {}
func _ready() -> void:
	for sound in get_children():
		map[sound.name] = sound

func play(sound:String, at:Vector2):
	map[sound].play(at)
