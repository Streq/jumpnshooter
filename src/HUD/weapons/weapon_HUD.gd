extends Control
onready var sprite: Sprite = $Sprite

export var weapon_name := ""

const FILE_PATH := "res://assets/texture/gun_select/"

func _ready() -> void:
	var FILE_NAME = weapon_name+".png"
	sprite.texture = load(FILE_PATH.plus_file(FILE_NAME))
