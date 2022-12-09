extends Node
tool

export var texture : Texture
export var voice : AudioStream setget set_voice

onready var voice_stream_player :AudioStreamPlayer = $stream
var moods := {}


var is_ready = false
func set_voice(val):
	voice = val
		
	if is_ready:
		voice_stream_player.stream = val

func _ready():
	is_ready = true
	set_voice(voice)
	if has_node("moods"):
		for child in $moods.get_children():
			moods[child.name] = child


func get_voice(mood):
	if moods.has(mood) and moods[mood].voice:
		return moods[mood].voice_stream_player
	return voice_stream_player

func get_texture(mood):
	if moods.has(mood) and moods[mood].texture:
		return moods[mood].texture
	return texture
