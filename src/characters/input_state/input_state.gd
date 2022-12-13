extends Node
class_name InputState

var A := ButtonState.new()
var B := ButtonState.new()
var L := ButtonState.new()
var R := ButtonState.new()
var dir := Vector2()

func _physics_process(delta: float) -> void:
	A.stale()
	B.stale()
	L.stale()
	R.stale()
