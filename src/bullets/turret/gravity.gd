extends Node

onready var bullet = get_parent()

export var gravity := 100.0

func _physics_process(delta: float) -> void:
	bullet.velocity.y += gravity*delta
