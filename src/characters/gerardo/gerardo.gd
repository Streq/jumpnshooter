extends KinematicBody2D
signal change_gun(gun)

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

onready var lower_body_animation = $lower_body_animation
onready var upper_body_animation = $upper_body_animation
onready var gun_hold = $pivot/upper_body_pivot/gun_hold
onready var pivot = $pivot
onready var input_state: InputState = $input_state

var held_jump = false
var jumping = false
var grounded = false
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

func _physics_process(delta):
	jumping = false
	var direction = input_state.dir
	
#	velocity.x = lerp(velocity.x, sign(direction.x) * speed, 4.0*delta)
	if input_state.B.is_pressed():
		gun_hold.pull_trigger()
	else:
		gun_hold.release_trigger()
	
	if !input_state.A.is_pressed() or is_on_floor():
		held_jump = false
	
	
	if input_state.A.is_just_pressed() and is_on_floor():
		jumping = true
		jump()
		held_jump = true
	
	
	if direction.x:
		set_facing_dir(direction.x)

		if is_on_floor():
			velocity.x += sign(direction.x)*horizontal_acceleration*delta
			lower_body_animation.play("run")
			if !grounded:
				#start on second frame
				lower_body_animation.seek(0.1)
		else:
			lower_body_animation.play("air")
			velocity.x += sign(direction.x)*horizontal_air_acceleration*delta
	else:
		if is_on_floor():
			velocity.x -= sign(velocity.x)*min(horizontal_decceleration*delta,abs(velocity.x))
			lower_body_animation.play("idle")
		else:
			velocity.x -= sign(velocity.x)*min(horizontal_air_decceleration*delta,abs(velocity.x))
			lower_body_animation.play("air")
	
	grounded = is_on_floor()
	
	if direction.y<0:
		upper_body_animation.play("point_up")
	else:
		upper_body_animation.play("point_forward")
	velocity.x = clamp(velocity.x, -speed, speed)

	var gravity = soft_gravity if held_jump else hard_gravity
	var gravity_dir = -get_floor_normal() if is_on_floor() else Vector2.DOWN
	velocity += gravity_dir*gravity*delta
	
	if !is_on_floor():
		velocity.y = min(fall_speed, velocity.y)
	
	update()
	var snap = Vector2.DOWN if !jumping else Vector2.ZERO
	velocity = move_and_slide_with_snap(velocity, snap, Vector2.UP, true,4,deg2rad(52))
	
func set_gun(gun):
	emit_signal("change_gun", gun)
	
func _ready():
	set_facing_dir(facing_dir)

func jump():
	velocity.y = -jump_speed


func _draw():
	return
	draw_line(Vector2(),velocity,Color.green)
	draw_arc(Vector2(),speed,0,PI*2,360,Color.purple)
	draw_rect(Rect2(-Vector2(speed,speed),Vector2(speed*2,speed*2)),Color.purple,false)
	pass
static func project_and_extend_to_cover(covered:Vector2,projected:Vector2):
	var projection = projected.project(covered)
	return projected*sqrt(covered.length_squared()/projection.length_squared())

