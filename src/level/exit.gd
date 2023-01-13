extends Area2D

export (String, FILE, "*.tscn") var to_zone := ""
export (Transition.SIDE) var side := Transition.SIDE.RIGHT
export var player_spawn_point := 0



func _on_exit_area_entered(area: Area2D) -> void:
	Transition.fade(Transition.ANIMATION.BLACKOUT, side)
	yield(Transition,"finished")
	Globals.transition_side = side
	var facing_dir = area.get_parent().facing_dir
	owner.exit(to_zone, player_spawn_point, facing_dir)
