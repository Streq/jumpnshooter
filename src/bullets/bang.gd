extends Area2D

export var damage := 5.0
export var team := 0
var hit_enemies := []

func _physics_process(delta: float) -> void:
	for area in get_overlapping_areas():
		if area in hit_enemies or area.owner.team == team:
			continue
		area.get_hit(self)
		hit_enemies.append(area)
func initialize(source):
	pass
