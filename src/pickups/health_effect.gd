extends Node
export var amount := 3

func trigger(area):
	var target = area.get_parent()
	target.add_health(amount)
