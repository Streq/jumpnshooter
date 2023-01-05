extends Node
export var amount := 3

func trigger(target):
	target.add_health(amount)
