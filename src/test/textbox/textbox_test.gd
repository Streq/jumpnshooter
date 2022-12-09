extends Node2D


onready var textbox = $CanvasLayer/simple_textbox

export (String, MULTILINE) var text := ""


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	textbox.say(TextRequest.new("""La vida es asi negro.
	
	
	Nadie te quiere y nadie te odia.
	
	
	Nada es personal.
	
	
	Todo es transaccional.
	""", "Almohado", "normal"))
	yield(textbox,"display_finished")
	textbox.say(TextRequest.new("""perdon, me estas hablando a mi?""", "Toto", "normal"))
	yield(textbox,"display_finished")
	textbox.say(TextRequest.new("a ver disculpame", "Almohado", "normal"))
	yield(textbox,"display_finished")
	textbox.say(TextRequest.new("no, al telefono", "Almohado", "normal"))
	yield(textbox,"display_finished")
	textbox.say(TextRequest.new("ah ajaj", "Toto", "normal"))
	
