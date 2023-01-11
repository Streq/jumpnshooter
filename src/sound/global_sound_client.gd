extends Node2D


export var sound := ""


func play():
	.play(sound,global_position)
