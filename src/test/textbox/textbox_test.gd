extends Node2D


onready var simple_textbox: Label = $CanvasLayer/simple_textbox

export (String, MULTILINE) var text := ""


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	simple_textbox.say_new(TextRequest.new(text, "nada", "nada"))
