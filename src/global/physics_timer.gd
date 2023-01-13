extends Node

func create_timer(time, bound_node = get_tree()) -> SceneTreeTween:
	var tween = bound_node\
		.create_tween()\
		.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.tween_interval(time)
	return tween
