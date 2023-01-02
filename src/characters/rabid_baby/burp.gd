extends CharacterState

func _physics_update(delta):
	character.velocity.x -= sign(character.velocity.x)*min(character.horizontal_decceleration*delta,abs(character.velocity.x))
	
	pass
