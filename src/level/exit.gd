extends Area2D


export (String, FILE, "*.tscn") var to_zone := ""
export var player_spawn_point := 0



func _on_exit_area_entered(area: Area2D) -> void:
	owner.exit(to_zone, player_spawn_point)
