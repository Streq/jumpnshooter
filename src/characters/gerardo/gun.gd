extends Node2D
signal shoot()
signal shoot_up()
export var BULLET : PackedScene
export var cooldown := 0.2
export var automatic := false
export var team := 0

var wearer = null

var trigger := ButtonState.new()

var current_cooldown = 0.0
onready var muzzle = $muzzle


func _physics_process(delta):
	if trigger.is_pressed() and (automatic or trigger.just_updated) and !current_cooldown:
		if wearer.is_looking_up():
			shoot_up()
		else:
			shoot()
		current_cooldown = cooldown
	current_cooldown = max(0.0, current_cooldown-delta)
	trigger.stale()

func shoot():
	emit_signal("shoot")
	
func shoot_up():
	emit_signal("shoot_up")

func pull_trigger():
	trigger.press()
func release_trigger():
	trigger.release()

func get_world():
	return owner.get_world()
