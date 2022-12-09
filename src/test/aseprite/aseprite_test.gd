extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
#	var res = []
#	print(OS.execute("aseprite", PoolStringArray(["."]),true,res,true,true))
#	print(res)
#
	var output = []
	OS.execute('aseprite', ['--version'], true, output, true, true) 
	print(output)
