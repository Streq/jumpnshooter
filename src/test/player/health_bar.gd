extends MarginContainer
onready var HEART : PackedScene = load($hearts/heart.filename)

onready var hearts: HBoxContainer = $hearts



func update_health(amount):
	var children = hearts.get_children()
	for i in amount:
		children[i].on()
	for i in range(amount,children.size()):
		children[i].off()
func update_max_health(amount):
	var children = hearts.get_children()
	var difference =  amount - children.size()
	if difference >= 0:
		for i in difference:
			hearts.add_child(HEART.instance())
	else:
		for i in -difference:
			hearts.get_child(hearts.get_child_count()-1).queue_free()


func _on_player_health_changed(value, max_value) -> void:
	update_max_health(max_value)
	update_health(value)
