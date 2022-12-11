extends Node2D
signal shoot()
export var BULLET : PackedScene

var wearer = null

var trigger := ButtonState.new()

export var cooldown := 0.2
var current_cooldown = 0.0
onready var muzzle = $muzzle


func _physics_process(delta):
	if trigger.is_pressed() and !current_cooldown:
		shoot()
	current_cooldown = max(0.0, current_cooldown-delta)
	trigger.stale()

func shoot():
	var bullet = BULLET.instance()
	wearer.get_parent().add_child(bullet)
	bullet.global_transform = muzzle.global_transform
	current_cooldown = cooldown
	emit_signal("shoot")
func pull_trigger():
	trigger.press()
func release_trigger():
	trigger.release()
	
