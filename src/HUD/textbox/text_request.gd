class_name TextRequest


var text := ""
var who := ""
var mood := ""
func _init(text, who := "", mood := "") -> void:
	self.text = text
	self.who = who
	self.mood = mood
