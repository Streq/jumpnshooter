extends State

onready var burp_cooldown: Timer = $burp_cooldown
onready var up_attack_cooldown: Timer = $up_attack_cooldown

func _physics_update(delta: float):
	var baby = root.get_parent()
	var input : InputState = baby.input_state
	
	var pos = root.global_position
	var target = root.target
	var target_pos = target.global_position
	var distance_x = target_pos.x-pos.x
	
	distance_x = stepify(distance_x, 16.0)
	input.dir.x = sign(distance_x)
	if input.dir.x != baby.facing_dir:
		return
	input.B.release()
	input.dir.y = 0

	if (distance_x > 48
	and burp_cooldown.is_stopped() 
	and !is_attacking()
	):
		input.B.press()
		burp_cooldown.start()
		return
	
	if (up_attack_cooldown.is_stopped()
	and !is_attacking()
	and target in root.look_up_detect.get_overlapping_bodies()
	and root.platform_detect.is_colliding()
	):
		input.dir.y = -1
		input.B.press()
		up_attack_cooldown.start()
		return
func is_attacking():
	var state = root.get_parent().state_machine.current.name
	return state in ["up_attack", "burp"]
