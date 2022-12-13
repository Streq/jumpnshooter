extends KinematicBody2D
signal got_hit(damage)


onready var animation_player: AnimationPlayer = $AnimationPlayer
onready var pivot: Node2D = $pivot
onready var input_state: Node = $input_state
onready var damage_animation: AnimationPlayer = $damage_animation


var velocity := Vector2()

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


enum STATE {
	IDLE,
	WALK
}


func _physics_process(delta: float) -> void:
	var direction = input_state.dir
	
	if direction.x:
		set_facing_dir(direction.x)

		if is_on_floor():
			velocity.x += sign(direction.x)*horizontal_acceleration*delta
			animation_player.play("walk")
			if !grounded:
				#start on second frame
				animation_player.seek(0.1)
		else:
			animation_player.play("air")
			velocity.x += sign(direction.x)*horizontal_air_acceleration*delta
	else:
		if is_on_floor():
			velocity.x -= sign(velocity.x)*min(horizontal_decceleration*delta,abs(velocity.x))
			animation_player.play("idle")
		else:
			velocity.x -= sign(velocity.x)*min(horizontal_air_decceleration*delta,abs(velocity.x))
			animation_player.play("air")
	
	
	
	var gravity = soft_gravity #if held_jump else hard_gravity
	var gravity_dir = -get_floor_normal() if is_on_floor() else Vector2.DOWN
	velocity += gravity_dir*gravity*delta
	velocity.x = clamp(velocity.x, -speed, speed)
	if !is_on_floor():
		velocity.y = min(fall_speed, velocity.y)
	grounded = is_on_floor()
	var snap = Vector2.DOWN if is_on_floor() else Vector2.ZERO
	velocity = move_and_slide_with_snap(velocity, snap, Vector2.UP, true,4,deg2rad(52))
	
func _on_hit(damage):
	emit_signal("got_hit", damage)
	damage_animation.play("hurt")
