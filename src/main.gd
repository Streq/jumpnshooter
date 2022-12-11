extends Node


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var B = Vector2.RIGHT.rotated(PI/4)
	var A = Vector2.RIGHT
	print(project_and_extend_to_cover(A,B))
	
	

func project_and_extend_to_cover(covered:Vector2,projected:Vector2):
	var projection = projected.project(covered)
	return projected*sqrt(covered.length_squared()/projection.length_squared())
