extends Node2D
export var AUDIO : PackedScene
export var pool_size := 10

export var min_time_since_last_play := 1.0/60.0
var time_since_last_play := 1000000.0

var pool = []

var index = 0

func _ready() -> void:
	for i in pool_size:
		var audio = AUDIO.instance()
		pool.append(audio)
		add_child(audio)


func play(source_position):
	if time_since_last_play < min_time_since_last_play:
		return
	var sound : AudioStreamPlayer2D = pool[index]
	sound.global_position = source_position
	sound.play()
	index = (index+1)%pool_size
	time_since_last_play = 0.0
	
func _process(delta: float) -> void:
	time_since_last_play += delta
