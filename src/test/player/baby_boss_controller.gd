extends Node2D

export var player_path : NodePath
onready var target = get_node(player_path)
onready var state_machine: StateMachine = $state_machine
onready var look_up_detect: Area2D = $look_up_detect
onready var platform_detect: RayCast2D = $platform_detect

func _physics_process(delta: float) -> void:
	state_machine.physics_update(delta)
