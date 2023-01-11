extends ReferenceRect


func _ready() -> void:
	var camera : Camera2D = Group.get_one("player_camera")
	if !camera:
		return
	camera.limit_left = rect_global_position.x
	camera.limit_right = rect_global_position.x+rect_size.x
	camera.limit_top = rect_global_position.y
	camera.limit_bottom = rect_global_position.y+rect_size.y
	
