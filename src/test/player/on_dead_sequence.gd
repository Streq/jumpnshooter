extends Node
signal finished()

func trigger():
	var tree = get_tree()
	yield(tree.create_timer(3.0),"timeout")
	
	for child in get_children():
		child.trigger()
	
	yield(get_children()[-1],"finished")
	emit_signal("finished")
