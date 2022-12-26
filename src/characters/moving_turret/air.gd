extends CharacterState

func _physics_update(delta):
	var h_dir = input_state.dir.x
	if h_dir:
		character.set_facing_dir(h_dir)
		character.velocity.x += sign(h_dir)*character.horizontal_air_acceleration*delta
	else:
		character.velocity.x -= sign(character.velocity.x)*min(character.horizontal_air_decceleration*delta,abs(character.velocity.x))
	if character.is_on_floor():
		goto("idle")
		return
	
