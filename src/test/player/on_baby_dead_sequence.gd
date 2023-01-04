extends Node
signal finished()

onready var say: Node = $say
onready var say2: Node = $say2
onready var say3: Node = $say3

#func _ready() -> void:
#	trigger()

func trigger():
	var tree = get_tree()
	say.trigger()
	say2.trigger()
	yield(say2,"finished")
	yield(tree.create_timer(1.0),"timeout")
	say3.trigger()
	yield(say3,"finished")
	emit_signal("finished")
