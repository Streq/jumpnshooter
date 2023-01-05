extends Node
signal triggered


func _on_spawn_weapon_on_death_triggered(spawned_item) -> void:
	spawned_item.connect("triggered", self, "trigger")

func trigger():
	emit_signal("triggered")
