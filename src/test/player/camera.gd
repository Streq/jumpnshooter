extends Camera2D

export var lerp_speed := 1.0

export var horizontal_extent := 40
export var vertical_extent := 40

export var horizontal_lerp_target := 60
export var vertical_lerp_target := 60

export var velocity := Vector2()

func _ready():
	yield(get_parent(),"ready")
	offset.y = 0.0
	offset.x = 40*get_parent().facing_dir

func _process(delta):
#	offset = -global_position.posmod(1.0)
	var parent = get_parent()
	var h_dir := sign(parent.facing_dir)
	var v_dir := sign(parent.look_up_dir)
	
	
	var target_x = h_dir*horizontal_lerp_target if h_dir else sign(offset.x)*(horizontal_extent-horizontal_lerp_target)
	var target_y = v_dir*vertical_lerp_target if v_dir else sign(offset.y)*(vertical_extent-vertical_lerp_target)
	
	offset.x = clamp(lerp(offset.x, target_x, delta*lerp_speed), -horizontal_extent, horizontal_extent)
	offset.y = clamp(lerp(offset.y, target_y, delta*lerp_speed), -vertical_extent, vertical_extent)

	
	
