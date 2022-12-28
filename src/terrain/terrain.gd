tool
extends TileSet

const SQUARE = 2
const SLOPE = 7

var binds = {
	SQUARE : [SLOPE],
	SLOPE : [SQUARE]
}

func _is_tile_bound(drawn_id, neighbor_id):
	return drawn_id in binds and neighbor_id in binds[drawn_id]



func _init():
	if !Engine.editor_hint:
#		tile_set_texture(SPACE, null)
		pass
		
