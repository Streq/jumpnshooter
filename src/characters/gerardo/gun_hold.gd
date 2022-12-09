extends Node2D
signal trigger_pulled()
signal trigger_released()

var trigger_pulled = false setget set_trigger_pulled
var gun = null
func set_trigger_pulled(val):
	var prev_val = trigger_pulled
	trigger_pulled = val
	if prev_val != val:
		if val:
			emit_signal("trigger_pulled")
		else:
			emit_signal("trigger_released")
	
func pull_trigger():
	self.trigger_pulled = true
	
func release_trigger():
	self.trigger_pulled = false


func change_gun(gun):
	if self.gun:
		_remove_gun()
	_add_gun(gun)

func _add_gun(gun):
	release_trigger()
	self.gun = gun
	add_child(self.gun)
	connect("trigger_pulled",self.gun,"pull_trigger")
	connect("trigger_released",self.gun,"release_trigger")
	gun.wearer = owner

func _remove_gun():
	release_trigger()
	remove_child(self.gun)
	disconnect("trigger_pulled",self.gun,"pull_trigger")
	disconnect("trigger_released",self.gun,"release_trigger")
	self.gun.wearer = null
	self.gun = null
	
func _ready():
	if get_child_count():
		change_gun(get_child(0))
