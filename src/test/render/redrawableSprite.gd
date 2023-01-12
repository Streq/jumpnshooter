extends Sprite
tool
signal finished

onready var animation_player: AnimationPlayer = $AnimationPlayer

export var width := 320
export var height := 180

func trigger():
	animation_player.play("blackout")
	yield(animation_player,"animation_finished")
	emit_signal("finished")
func _draw() -> void:
	var frame_size = Vector2(
		texture.get_width()/hframes, 
		texture.get_height()/vframes
	)
	var src_rect = Rect2(frame_coords*frame_size,frame_size)
	for i in width:
		for j in height:
			var dst_rect = Rect2(Vector2(i*frame_size.x,j*frame_size.y),frame_size)
			draw_texture_rect_region(texture, dst_rect, src_rect)
		
func reset():
	animation_player.play("RESET")
func clear():
	animation_player.play("clear")
	yield(animation_player,"animation_finished")
	emit_signal("finished")
