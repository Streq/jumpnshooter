extends CanvasLayer
signal finished()
export var BLACKOUT : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in 20:
		var blackout = BLACKOUT.instance()
		blackout.width = 2
		blackout.position.x = i*2*8
		add_child(blackout)
		blackout.animation_player.playback_speed = 5.0
	
	
func play():
	
	get_tree().paused = true
	var children = get_children()
	for blackout in children:
		yield(get_tree().create_timer(1.0/60.0),"timeout")
		blackout.trigger()
	yield(children[-1],"finished")
	
	get_tree().paused = false
	emit_signal("finished")

func clear():
#	get_tree().paused = true
	var children = get_children()
	for i in children.size():
		yield(get_tree().create_timer(1.0/60.0),"timeout")
		children[-i-1].clear()
	yield(children[0],"finished")
#	get_tree().paused = false
	emit_signal("finished")
	
