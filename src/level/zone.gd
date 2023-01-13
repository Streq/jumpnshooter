extends Node2D
signal exit(to)

onready var spawn_positions: Node2D = $spawn_positions



func exit(to,spawn_point,facing_dir):
	Globals.spawn_position = spawn_point
	Globals.facing_dir = facing_dir
	emit_signal("exit",to,spawn_point)
	get_tree().change_scene(to)

func _ready() -> void:
	var spawn_pos = spawn_positions.get_child(Globals.spawn_position).global_position
	var player = Group.get_one("player")
	if player:
		player.global_position = spawn_pos
		player.facing_dir = Globals.facing_dir
	var side = Globals.transition_side
	Transition.fade(Transition.ANIMATION.CLEAR,Globals.transition_side)
	yield(Transition,"finished")
	
