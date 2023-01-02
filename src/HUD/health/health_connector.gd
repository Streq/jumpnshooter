extends Node


export var health_bar_path : NodePath
export var character_path : NodePath

func _ready() -> void:
#	yield(get_tree().current_scene,"ready")
	var health_bar = get_node(health_bar_path)
	var character = get_node(character_path)
	var health = character.get_node("./health")
	health.connect("changed",health_bar,"update_values")
