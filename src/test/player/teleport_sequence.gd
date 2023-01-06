extends Node2D
signal trigger
signal finished
onready var blackout: Sprite = $CanvasLayer/Control/blackout
onready var player: KinematicBody2D = $"../player"
onready var player_spot: Node2D = $CanvasLayer2/player_spot

func trigger():
	emit_signal("trigger")
	NodeUtils.reparent_keep_transform(player, player_spot)
	blackout.trigger()
	yield(blackout,"finished")
	emit_signal("finished")
	
