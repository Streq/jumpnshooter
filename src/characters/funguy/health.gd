extends Node
signal empty()
signal full()
signal changed(current_value, max_value)

export var value := 100.0 setget set_value
export var max_value := 100.0 setget set_max_value

func _ready() -> void:
	set_value(value)
	
	
func set_value(val):
	value = clamp(val,0,max_value)
	emit_signal("changed", value, max_value)
	if value == 0:
		emit_signal("empty")
	if value == max_value:
		emit_signal("full")

func set_max_value(val):
	max_value = val
	set_value(value)

func subtract(val):
	set_value(value-val)

func add(val):
	set_value(value+val)
