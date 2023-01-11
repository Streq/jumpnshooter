extends Node

func trigger(node):
	NodeUtils.reparent($player_area,node)
	NodeUtils.reparent($player_controller,node)
	NodeUtils.reparent($camera,node)
	queue_free()
