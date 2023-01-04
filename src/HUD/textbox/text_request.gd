class_name TextRequest

enum SIDE {
	LEFT = 0,
	CENTER = 1,
	RIGHT = 2
}

var text := ""
var who := ""
var mood := ""
var speed := 1.0
var show_name := true
var show_profile := true
var side : int = SIDE.LEFT


func _init(text, who := "", mood := "", show_name := true, show_profile := true, speed := 1.0, side := SIDE.LEFT) -> void:
	self.text = text
	self.who = who
	self.mood = mood
	self.show_name = show_name
	self.show_profile = show_profile
	self.speed = speed
	self.side = side
