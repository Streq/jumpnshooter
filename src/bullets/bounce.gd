extends Node


func _on_wall_collision(collision: KinematicCollision2D) -> void:
	var normal = collision.normal
	var velocity = owner.pre_collision_velocity.bounce(normal)
	owner.velocity = velocity
	
	#if the bounce is too weak reinforce it
	var projection = velocity.project(normal)
	if projection.length_squared() < 2500:
		owner.velocity += collision.normal * 50.0-projection
