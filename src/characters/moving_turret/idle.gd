extends CharacterState

func _physics_update(delta):
	character.velocity.x -= sign(character.velocity.x)*min(character.horizontal_decceleration*delta,abs(character.velocity.x))
		
	if !character.is_on_floor():
		goto("air")
		return
	
	var h_dir = input_state.dir.x
	character.set_facing_dir(h_dir)
	
	if input_state.A.is_just_pressed():
		character.velocity.y -= character.jump_speed
		return
	if input_state.B.is_just_pressed():
		goto("shoot")
		return
	if h_dir:
		goto("walk")
		return
