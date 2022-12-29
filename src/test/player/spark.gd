extends KinematicBody2D
onready var raycast: RayCast2D = $RayCast2D

func _physics_process(delta: float) -> void:
	if !move():
		rotate(-PI/2)
		return
#	print(raycast.is_colliding())
	if !raycast.is_colliding():
		rotate(PI/16)
		return
	var normal = raycast.get_collision_normal()
#	var tangent = (-normal).tangent()
	print(normal)
	var tangent_angle = (-normal.tangent()).angle()
	global_rotation = tangent_angle
	move()
func move():
	return move_and_slide(Vector2(1,0.5).rotated(global_rotation)*40,Vector2.UP.rotated(global_rotation))
