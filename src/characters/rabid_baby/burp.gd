extends CharacterState

func _physics_update(delta):
	character.velocity.x -= sign(character.velocity.x)*min(character.horizontal_decceleration*delta,abs(character.velocity.x))
	var h_dir = input_state.dir.x
	
	if input_state.B.is_just_pressed():
		var v_dir = input_state.dir.y
		if v_dir<0:
			goto("up_attack")
			return
		goto("burp")
		return
	
