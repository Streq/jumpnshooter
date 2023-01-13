extends CanvasLayer
signal finished()
export var BLACKOUT : PackedScene
onready var pivot: Control = $pivot

enum SIDE {
	UP = -2,
	LEFT = -1,
	CENTER = 0,
	RIGHT = 1,
	DOWN = 2
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
		
var last_anim = ANIMATION.CLEAR
func fade(
	animation_index := ANIMATION.BLACKOUT, 
	side := SIDE.CENTER, 
	anim_speed := 120.0, 
	spread_speed := 0.5/60.0
):
	
	if last_anim == animation_index:
		return
	last_anim = animation_index
	var animation = animation_map[animation_index]
	var horizontal = abs(side)<=1
	if horizontal:
		pivot.rect_rotation = 0.0
	else:
		pivot.rect_rotation = 90.0
	
	get_tree().paused = true
	
	var orientation = sign(side)
	var last_index = 0 if orientation<0 else -1
	if !orientation:
		for blackout in blackouts:
			blackout.play(animation, anim_speed)
	else:
		var offset = min(0, orientation)
		
		for i in blackouts.size():
			yield(PhysicsTimer.create_timer(spread_speed, self),"finished")
			var index = orientation*i+offset
			var blackout = blackouts[index]
			blackout.play(animation, anim_speed)
			
	yield(blackouts[last_index],"finished")
	emit_signal("finished")
	
	get_tree().paused = false
	pass

	
func blackout(side: int):
	get_tree().paused = true
	blacked = true
	var offset = min(0, side)
	for i in blackouts.size():
		var index = side*i+offset
		var blackout = blackouts[index]
		yield(PhysicsTimer.create_timer(0.5/60.0, self),"finished")
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
		yield(PhysicsTimer.create_timer(0.5/60.0, self),"finished")
		blackout.clear()
		
	var last_one = 0 if side < 0 else -1
	yield(blackouts[last_one],"finished")
	
	get_tree().paused = false
	emit_signal("finished")
	
	
