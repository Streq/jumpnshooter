extends Node
tool

export var texture : Texture
export var voice : AudioStream setget set_voice
export var volume_db := -12.0 setget set_volume_db
export var pitch_scale := 1.0 setget set_pitch_scale

func set_volume_db(val):
	volume_db = val
	$stream.volume_db = val
func set_pitch_scale(val):
	pitch_scale = val
	$stream.pitch_scale = val

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
	set_volume_db(volume_db)
	set_pitch_scale(pitch_scale)
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
