extends MarginContainer
onready var hearts: HBoxContainer = $hearts

func update_health(amount):
	var children = hearts.get_children()
	for i in amount:
		children[i].on()
	for i in range(amount,children.size()):
		children[i].off()
	
	 


func _on_player_health_changed(value, max_value) -> void:
	update_health(value)
