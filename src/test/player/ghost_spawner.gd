extends Node2D

export var MOB : PackedScene
export (float, -1, 1, 2)var facing_dir := 1.0

func spawn():
	var mob = MOB.instance()
	owner.get_parent().get_parent().add_child(mob)
	mob.global_transform = global_transform
	mob.facing_dir = facing_dir
	return mob
