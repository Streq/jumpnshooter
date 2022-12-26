extends CharacterState

func _physics_update(delta):
	var h_dir = sign(input_state.dir.x)
	character.velocity.x += h_dir*character.horizontal_acceleration*delta
	character.set_facing_dir(h_dir)
	if !character.is_on_floor():
		goto("air")
		return
	if input_state.A.is_just_pressed():
		character.velocity.y -= character.jump_speed
		return
	if input_state.B.is_just_pressed():
		goto("shoot")
		return
	if !h_dir:
		goto("idle")
		return
	
	
