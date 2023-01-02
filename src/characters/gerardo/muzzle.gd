extends Node2D
signal shoot

export var speed := 100.0
export var bullet_lifetime := -1.0
export var BULLET : PackedScene

func shoot():
	var bullet = BULLET.instance()
	owner.get_world().add_child(bullet)
	bullet.global_transform = global_transform
	if speed >= 0.0:
		bullet.speed = speed
	if bullet_lifetime >= 0.0:
		bullet.lifetime = bullet_lifetime
	bullet.team = owner.team
	bullet.initialize(self)
	emit_signal("shoot")
