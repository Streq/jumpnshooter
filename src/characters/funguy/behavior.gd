extends Node


func _physics_process(delta: float) -> void:
	var character = get_parent()
	var direction = character.input_state.dir
	
#	if direction.x:
#		character.set_facing_dir(direction.x)
#
#		if character.is_on_floor():
#			character.velocity.x += sign(direction.x)*character.horizontal_acceleration*delta
#			character.animation_player.play("walk")
#			if !character.grounded:
#				#start on second frame
#				character.animation_player.seek(0.1)
#		else:
#			character.animation_player.play("air")
#			character.velocity.x += sign(direction.x)*character.horizontal_air_acceleration*delta
#	else:
#		if character.is_on_floor():
#			character.velocity.x -= sign(character.velocity.x)*min(character.horizontal_decceleration*delta,abs(character.velocity.x))
#			character.animation_player.play("idle")
#		else:
#			character.velocity.x -= sign(character.velocity.x)*min(character.horizontal_air_decceleration*delta,abs(character.velocity.x))
#			character.animation_player.play("air")
#
#
	
	var gravity = character.soft_gravity #if held_jump else hard_gravity
	var gravity_dir = -character.get_floor_normal() if character.is_on_floor() else Vector2.DOWN
	character.velocity += gravity_dir*gravity*delta
	character.velocity.x = clamp(character.velocity.x, -character.speed, character.speed)
	if !character.is_on_floor():
		character.velocity.y = min(character.fall_speed, character.velocity.y)
	character.grounded = character.is_on_floor()
	var snap = Vector2.DOWN if character.grounded else Vector2.ZERO
	character.velocity = character.move_and_slide_with_snap(character.velocity, snap, Vector2.UP, true,4,deg2rad(52))
