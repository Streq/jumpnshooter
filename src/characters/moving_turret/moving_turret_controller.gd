extends Node2D

var input : InputState
var target = null
onready var target_detect: Area2D = $pivot/target_detect
onready var hind = $pivot/target_detect/hind
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

	if targets_on_sight:
		target = targets_on_sight[0]
	else:
		target = null
	
	var has_floor_ahead = floor_detect.get_overlapping_bodies()
	
	if target:
		var dir_target = sign(target.global_position.x - global_position.x)
		if has_floor_ahead or dir_target != root.facing_dir:
			input.dir.x = dir_target
		else:
			input.dir.x = 0.0
	elif has_floor_ahead or !root.is_on_floor():
		input.dir.x = root.facing_dir
	else:
		input.dir.x = -root.facing_dir

	
	if root.animation_player.current_animation == "shoot":
		shoot_cooldown.start()
	
	input.B.release()
	
	if targets_on_sight.size()>0 and shoot_cooldown.is_stopped():
		input.B.pressed = true

func _on_got_hit(damage):
	hind.set_deferred("disabled", false)
	hind_lookout_timer.start()

func _on_hind_lookout_timer_timeout():
	hind.set_deferred("disabled", true)
