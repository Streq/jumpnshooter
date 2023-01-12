extends Node2D


export var sound := ""


func play():
	Sounds.play(sound,global_position)
