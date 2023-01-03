extends KinematicBody2D
signal got_hit(damage)


onready var animation_player: AnimationPlayer = $AnimationPlayer
onready var pivot: Node2D = $pivot
onready var input_state: InputState = $input_state
onready var damage_animation: AnimationPlayer = $damage_animation
onready var state_machine = $state_machine


export var invulnerable := false
export var pass_through := false

var velocity := Vector2()
export var team := 0

export var speed = 75.0
export var soft_gravity = 150.0
export var hard_gravity = 500.0
export var fall_speed = 100.0

export var horizontal_acceleration = 500.0
export var horizontal_air_acceleration = 200.0
export var horizontal_decceleration = 500.0
export var horizontal_air_decceleration = 10.0

export var jump_speed = 100.0

export (float, -1.0, 1.0, 2.0) var facing_dir := 1.0 setget set_facing_dir
export (float, -1.0, 0.0, 1.0) var look_up_dir := 0.0 setget set_lookup_dir
func set_facing_dir(val):
	if val:
		facing_dir = sign(val)
		if pivot:
			pivot.scale.x = facing_dir
func set_lookup_dir(val):
	if val<0:
		look_up_dir = -1.0
	else:
		look_up_dir = 0.0

var grounded = false

func _on_hit(by):
	if invulnerable:
		return
	emit_signal("got_hit", by.damage)
#	damage_animation.queue("hurt")
	damage_animation.play("hurt")
	
func _physics_process(delta):
	state_machine.physics_update(delta)

func get_world():
	return get_parent()

func _ready() -> void:
	set_facing_dir(facing_dir)
