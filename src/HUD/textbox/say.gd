extends Node
signal finished()
export (String, MULTILINE) var text := ""
export var who := ""
export var mood := ""
export var show_name := true
export var show_profile := true

enum SIDE{
	LEFT = 0,
	CENTER = 1,
	RIGHT = 2
}
export var speed := 1.0
export(SIDE) var side : int = SIDE.LEFT

onready var dialog: VBoxContainer = $"%dialog"


func trigger():
	dialog.say(TextRequest.new(text, who, mood, show_name, show_profile, speed, side))
	yield(dialog, "display_finished")
	emit_signal("finished")
