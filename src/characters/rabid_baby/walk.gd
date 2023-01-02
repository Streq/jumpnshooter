extends CharacterState

func _physics_update(delta):
	var h_dir = input_state.dir.x
	character.velocity.x += h_dir*character.horizontal_acceleration*delta
	
	if h_dir and sign(h_dir) != character.facing_dir:
		character.set_facing_dir(h_dir)
		goto("turn")
		return
	if input_state.B.is_just_pressed():
		var v_dir = input_state.dir.y
		if v_dir<0:
			goto("up_attack")
			return
		goto("burp")
		return
	if !h_dir:
		goto("idle")
		return
