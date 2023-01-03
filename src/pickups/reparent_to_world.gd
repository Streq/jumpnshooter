extends Node


func trigger():
	NodeUtils.reparent_keep_transform(get_parent(),owner.get_parent())
