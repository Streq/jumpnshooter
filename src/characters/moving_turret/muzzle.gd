extends Node2D

export var BULLET : PackedScene

func shoot():
	var bullet = BULLET.instance()
	owner.get_parent().add_child(bullet)
	bullet.global_transform = self.global_transform
	bullet.team = owner.team
	bullet.initialize()
