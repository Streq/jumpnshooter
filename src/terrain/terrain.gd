tool
extends TileSet

const SQUARE = 2
const SLOPE = 7
const HILL = 1
const HILL_NO_FLOOR = 9
var binds = {
	SQUARE : [SLOPE],
	SLOPE : [SQUARE],
	HILL : [HILL_NO_FLOOR],
	HILL_NO_FLOOR : [HILL]
}

func _is_tile_bound(drawn_id, neighbor_id):
	return drawn_id in binds and neighbor_id in binds[drawn_id]



func _init():
	if !Engine.editor_hint:
#		tile_set_texture(SPACE, null)
		pass
		
