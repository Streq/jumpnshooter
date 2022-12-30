extends KinematicBody2D
onready var raycast: RayCast2D = $RayCast2D
onready var sprite: Sprite = $Sprite
onready var animation_player: AnimationPlayer = $AnimationPlayer


export var stopped_threshold := 0.005
export var speed := 50.0
export var damage := 4.0
export (float, -1, 1, 2) var facing_dir := 1.0


func _ready() -> void:
#	raycast.cast_to*=facing_dir
	pass
func _process(delta: float) -> void:
	sprite.global_rotation = 0
	

func _physics_process(delta: float) -> void:
	var previous_position = global_position
	var vel = move()
	if !vel or previous_position.distance_squared_to(global_position)<stopped_threshold:
		rotate(-PI*facing_dir/2)
		return
	var tries = 5
	while !raycast.is_colliding():
		print(raycast.cast_to.rotated(global_rotation))
		rotate(PI*facing_dir/8)
		raycast.force_raycast_update()
		tries -= 1
		if !tries:
			queue_free()
			return
	var normal = raycast.get_collision_normal()
	var tangent_angle = (-normal.tangent()).angle()
	global_rotation = tangent_angle
	move()
func move():
	return move_and_slide(Vector2(1*facing_dir,0.5).rotated(global_rotation)*speed,Vector2.UP.rotated(global_rotation))


func _on_lifetime_timeout() -> void:
	animation_player.play("disappear")
	yield(animation_player,"animation_finished")
	queue_free()


func _on_hitbox_area_entered(area: Area2D) -> void:
	area.get_hit(self)
	queue_free()
#	bullet_hit.show()
#	bullet_hit.play()
#	NodeUtils.reparent_keep_transform(bullet_hit,get_parent())
#	emit_signal("hit")

func initialize(source):
	facing_dir = source.facing_dir
