extends Node2D

var input : InputState
#var target = null
onready var target_detect: Area2D = $pivot/target_detect
onready var hind = $pivot/target_detect/hind
onready var downard_target_detect: Area2D = $pivot/downard_target_detect

onready var pivot = $pivot

onready var root = get_parent()
onready var shoot_cooldown = $shoot_cooldown
onready var floor_detect = $pivot/floor_detect
onready var hind_lookout_timer = $hind_lookout_timer


func _ready():
	yield(root,"ready")
	input = root.input_state
	NodeUtils.reparent_keep_transform(pivot, root.pivot)
	root.connect("got_hit",self,"_on_got_hit")

func _physics_process(delta: float) -> void:
	var targets_on_sight = target_detect.get_overlapping_areas()
	var targets_on_down_sight = downard_target_detect.get_overlapping_areas()
	var target = null
	var down_target = null
	
	if targets_on_sight:
		target = targets_on_sight[0]
	elif targets_on_down_sight:
		down_target = targets_on_down_sight[0]
		
	var has_floor_ahead = floor_detect.get_overlapping_bodies()
	input.dir.y = 0.0
	if target:
		var dir_target = sign(target.global_position.x - global_position.x)
		if has_floor_ahead or dir_target != root.facing_dir:
			input.dir.x = dir_target
		else:
			input.dir.x = 0.0
	elif down_target:
		input.dir.y = 1.0
	elif (has_floor_ahead or !root.is_on_floor()) and (!root.is_on_wall()):
		input.dir.x = root.facing_dir
	else:
		input.dir.x = -root.facing_dir

	
	if root.animation_player.current_animation in ["shoot", "shoot_down"]:
		shoot_cooldown.start()
	
	input.B.release()
	
	if (target or down_target) and shoot_cooldown.is_stopped():
		input.B.pressed = true

func _on_got_hit(damage):
	hind.set_deferred("disabled", false)
	hind_lookout_timer.start()

func _on_hind_lookout_timer_timeout():
	hind.set_deferred("disabled", true)
