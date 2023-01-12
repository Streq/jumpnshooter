extends CanvasLayer
signal finished()
export var BLACKOUT : PackedScene
onready var pivot: Control = $pivot

enum SIDE_H {
	LEFT = -1,
	CENTER = 0,
	RIGHT = 1,
}
enum SIDE_V {
	UP = -1,
	CENTER = 0,
	DOWN = 1,
}

enum ANIMATION {
	BLACKOUT,
	CLEAR
}

const animation_map = {
	ANIMATION.BLACKOUT: "blackout",
	ANIMATION.CLEAR: "clear"
}
var blackouts := []

var blacked = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in 20:
		var blackout = BLACKOUT.instance()
		blackout.width = 2
		blackout.height = 40
		pivot.add_child(blackout)
		blackout.global_position.x = i*2*8
		blackout.global_position.y = -9*8
		blackout.animation_player.playback_speed = 120.0
		blackouts.append(blackout)
		
#	pivot.rect_rotation = -90.0
var last_anim = ANIMATION.BLACKOUT
func fade(
	animation := ANIMATION.BLACKOUT, 
	horizontal := true,
	side := SIDE_H.CENTER, 
	anim_speed := 120.0, 
	spread_speed := 0.5/60.0
):
	if last_anim == animation:
		return
	if horizontal:
		pivot.rect_rotation = 0.0
	else:
		pivot.rect_rotation = 90.0
	get_tree().paused = true
	last_anim = animation
	var children = get_children()
	var offset = min(0, side)
	if !side:
		children[0]
	
	
	pass

	
func blackout(side: int):
	get_tree().paused = true
	blacked = true
	var offset = min(0, side)
	for i in blackouts.size():
		var index = side*i+offset
		var blackout = blackouts[index]
		yield(get_tree().create_timer(0.5/60.0),"timeout")
		blackout.trigger()
		
	var last_one = 0 if side < 0 else -1
	yield(blackouts[last_one],"finished")
	
	get_tree().paused = false
	emit_signal("finished")
	
func clear(side: int):
	if !blacked:
		return
	blacked = false
	get_tree().paused = true
	var offset = min(0, side)
	for i in blackouts.size():
		var index = side*i+offset
		var blackout = blackouts[index]
		yield(get_tree().create_timer(0.5/60.0),"timeout")
		blackout.clear()
		
	var last_one = 0 if side < 0 else -1
	yield(blackouts[last_one],"finished")
	
	get_tree().paused = false
	emit_signal("finished")
	
	
