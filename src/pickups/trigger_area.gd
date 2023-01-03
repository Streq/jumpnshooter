extends Area2D
signal triggered
func _ready() -> void:
	connect("area_entered",self,"_on_area_entered")
	

func _on_area_entered(area):
	emit_signal("triggered")
