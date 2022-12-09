extends KinematicBody2D
signal change_gun(gun)

var velocity := Vector2()

export var speed = 75.0
export var soft_gravity = 150.0
export var hard_gravity = 500.0
export var fall_speed = 100.0

export var horizontal_acceleration = 500.0
export var horizontal_decceleration = 500.0
export var jump_speed = 100.0

export (float, -1.0, 1.0, 2.0) var facing_dir := 1.0 setget set_facing_dir

onready var lower_body_animation = $lower_body_animation
onready var upper_body_animation = $upper_body_animation
onready var gun_hold = $pivot/upper_body_pivot/gun_hold
onready var pivot = $pivot

var held_jump = false

func set_facing_dir(val):
	if val:
		facing_dir = sign(val)
		if pivot:
			pivot.scale.x = facing_dir

func _physics_process(delta):
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	
#	velocity.x = lerp(velocity.x, sign(direction.x) * speed, 4.0*delta)
	if Input.is_action_pressed("B"):
		gun_hold.pull_trigger()
	else:
		gun_hold.release_trigger()
	
	if Input.is_action_just_pressed("A") and is_on_floor():
		jump()
		held_jump = true
	
	if !Input.is_action_pressed("A"):
		held_jump = false
	
	if direction.x:
		set_facing_dir(direction.x)
		
		if is_on_floor():
			velocity.x += sign(direction.x)*horizontal_acceleration*delta
			lower_body_animation.play("run")
		else:
			lower_body_animation.play("air")
	else:
		if is_on_floor():
			velocity.x -= sign(velocity.x)*min(horizontal_decceleration*delta,abs(velocity.x))
			lower_body_animation.play("idle")
		else:
			lower_body_animation.play("air")
			
	if direction.y<0:
		upper_body_animation.play("point_up")
	else:
		upper_body_animation.play("point_forward")
	velocity.x = clamp(velocity.x, -speed, speed)
	var gravity = soft_gravity if held_jump else hard_gravity
	velocity.y = min(velocity.y+gravity*delta, fall_speed)
	
	velocity = move_and_slide(velocity, Vector2.UP)


func set_gun(gun):
	emit_signal("change_gun", gun)
	
func _ready():
	set_facing_dir(facing_dir)

func jump():
	velocity.y -= jump_speed
