extends Area2D


export (String, FILE, "*.tscn") var to_zone := ""
export var player_spawn_point := 0



func _on_exit_area_entered(area: Area2D) -> void:
	Transition.play()
	yield(Transition,"finished")
	var facing_dir = area.get_parent().facing_dir
	owner.exit(to_zone, player_spawn_point, facing_dir)
