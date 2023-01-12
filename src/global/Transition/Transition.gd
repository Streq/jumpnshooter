extends CanvasLayer
signal finished()
export var BLACKOUT : PackedScene
var blacked = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in 20:
		var blackout = BLACKOUT.instance()
		blackout.width = 2
		blackout.position.x = i*2*8
		add_child(blackout)
		blackout.animation_player.playback_speed = 120.0
	
	
func blackout(side):
	get_tree().paused = true
	blacked = true
	var children = get_children()
	var offset = min(0, side)
	for i in children.size():
		var index = side*i+offset
		var blackout = children[index]
		yield(get_tree().create_timer(0.5/60.0),"timeout")
		blackout.trigger()
		
	var last_one = 0 if side < 0 else -1
	yield(children[last_one],"finished")
	
	get_tree().paused = false
	emit_signal("finished")
func clear(side):
	if !blacked:
		return
	blacked = false
	get_tree().paused = true
	var children = get_children()
	var offset = min(0, side)
	for i in children.size():
		var index = side*i+offset
		var blackout = children[index]
		yield(get_tree().create_timer(0.5/60.0),"timeout")
		blackout.clear()
		
	var last_one = 0 if side < 0 else -1
	yield(children[last_one],"finished")
	
	get_tree().paused = false
	emit_signal("finished")
	
	
