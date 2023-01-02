extends Node

export var BANG : PackedScene
export (float, -1, 1, 2) var facing_dir := 1.0
func trigger():
	var bang = BANG.instance()
	owner.get_parent().add_child(bang)
	bang.global_position = owner.global_position
	bang.team = owner.team
	bang.initialize(self)


func initialize(source):
	facing_dir = source.owner.wearer.facing_dir
