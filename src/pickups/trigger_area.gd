extends Area2D
signal triggered(by)
func _ready() -> void:
	connect("area_entered",self,"_on_area_entered")
	

func _on_area_entered(area):
	var by = area.get_parent()
	emit_signal("triggered", by)
