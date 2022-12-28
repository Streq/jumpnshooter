extends CharacterState

func _physics_update(delta):
	character.velocity.x -= sign(character.velocity.x)*min(character.horizontal_decceleration*delta,abs(character.velocity.x))
	
	if !character.is_on_floor():
		goto("air")
		return

func _on_animation_finished(anim):
#	muzzle.shoot()
	._on_animation_finished(anim)
