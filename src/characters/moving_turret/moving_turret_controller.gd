extends Node2D

var input : InputState
var target = null
onready var target_detect: Area2D = $target_detect

onready var root = get_parent()


func _ready():
	yield(root,"ready")
	input = root.input_state


func _physics_process(delta: float) -> void:
	var targets = target_detect.get_overlapping_areas()

	if targets:
		target = targets[0]

	
	input.dir.x = 0
	if target:
		input.dir.x = sign(target.global_position.x - global_position.x)


	input.B.pressed = targets.size()>0
