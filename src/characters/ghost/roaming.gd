extends CharacterState


export var t = 0.5
export var vertical_oscilation := 50
export var frequency := 1.0
func _physics_process(delta: float) -> void:
	
	var h_dir = sign(character.facing_dir)
	character.velocity.x += h_dir*character.horizontal_acceleration*delta
	character.set_facing_dir(h_dir)
	character.velocity.y = sin(t*PI*frequency)*vertical_oscilation
	t+=delta
