class_name TextRequest


var text := ""
var who := ""
var mood := ""
var speed := 1.0
var show_name := true
func _init(text, who := "", mood := "", show_name := true, speed := 1.0) -> void:
	self.text = text
	self.who = who
	self.mood = mood
	self.show_name = show_name
	self.speed = speed
