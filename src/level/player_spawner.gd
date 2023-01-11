extends Node2D

export var enabled = true
export var MAKE_PLAYER_CHARACTER : PackedScene

func _init() -> void:
	pass
	
func _ready():
	if !enabled:
		return
	var weapons = Globals.weapons
	var max_health = Globals.max_health
	var current_health = Globals.current_health
	var facing_dir = 1.0
	var player = Globals.PLAYER.instance()
	var make_player_character = MAKE_PLAYER_CHARACTER.instance()
	make_player_character.trigger(player)
	add_child(player)
	player.max_health = max_health
	player.health = current_health
	player.set_facing_dir(facing_dir)
