extends Node
export var PLAYER : PackedScene
var spawned_player := false
var weapons := []
var max_health := 3
var current_health := 3
var facing_dir = 1.0

var spawn_position := 0
var transition_side := 1.0
