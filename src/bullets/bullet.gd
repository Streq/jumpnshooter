extends Node2D

export var speed := 200.0

func _physics_process(delta):
	move_local_x(delta*speed)
