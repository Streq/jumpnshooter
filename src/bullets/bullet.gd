extends KinematicBody2D
signal initialized()
signal initialize(source)
signal hit()
signal wall_collision(collision)
signal hit_wall()
export var damage := 1.0
export var speed := 200.0
export var team := 0
onready var bullet_hit: Sprite = $bullet_hit
onready var animation_player: AnimationPlayer = $AnimationPlayer
export var drag := 0.0
export var constant_drag := 0.0
export var disappear_on_wall := true
export var lifetime := 1.0
export (float, -1, 1, 2) var facing_dir:= 1.0

onready var lifetime_timer: Timer = $lifetime

var pre_collision_velocity := Vector2()

var velocity := Vector2()

func initialize(source):
	velocity = Vector2.RIGHT.rotated(global_rotation)*speed
	lifetime_timer.wait_time = lifetime
	lifetime_timer.start()
	emit_signal("initialize", source)
	emit_signal("initialized")
	
func _physics_process(delta):
	velocity *= (1.0-drag*delta)
	velocity = velocity.move_toward(Vector2.ZERO, delta*constant_drag)
	
	pre_collision_velocity = velocity
	move_and_slide(velocity)
	
	if get_slide_count():
		_on_wall_collision(get_slide_collision(0))


func _on_Timer_timeout():
	animation_player.play("disappear")
	yield(animation_player,"animation_finished")
	queue_free()


func _on_wall_collision(collision: KinematicCollision2D) -> void:
	if disappear_on_wall:
		queue_free()
		bullet_hit.show()
		bullet_hit.play()
		NodeUtils.reparent_keep_transform(bullet_hit,get_parent())
	emit_signal("wall_collision", collision)
	emit_signal("hit_wall")
	

func _on_hitbox_area_entered(area: Area2D) -> void:
	var target = area.owner
	if target.team == team or target.pass_through:
		return
	area.owner._on_hit(self)
	queue_free()
	bullet_hit.show()
	bullet_hit.play()
	NodeUtils.reparent_keep_transform(bullet_hit,get_parent())
	emit_signal("hit")

