extends Node


export var recoil := 4.0
export var fixed_distance := 1.0
func trigger():
	var recoil_direction = Vector2.RIGHT.rotated(get_parent().global_rotation)
	var wearer = owner.wearer
	owner.wearer.move_and_collide(-recoil_direction*fixed_distance)
	if !wearer.is_on_floor():
		wearer.velocity -= recoil_direction*recoil
	
