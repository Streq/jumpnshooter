extends Node
signal finished()
export (String, MULTILINE) var text := ""
export var who := ""
export var mood := ""
export var show_name := true
onready var dialog: VBoxContainer = $"%dialog"


func trigger():
	dialog.say(TextRequest.new(text,who,mood,show_name))
	yield(dialog,"display_finished")
	emit_signal("finished")
