class_name TextRequest


var text := ""
var who := ""
var mood := ""
var pause := true
func _init(text, who := "", mood := "", pause := true) -> void:
	self.text = text
	self.who = who
	self.mood = mood
	self.pause = pause
