extends KinematicBody2D
signal initialize
export var speed := 200.0
export var fix_transform := false
onready var bullet_hit: Sprite = $bullet_hit
onready var sprite: Sprite = $Sprite


var velocity := Vector2()

func initialize():
	velocity = Vector2.RIGHT.rotated(global_rotation)*speed
	if fix_transform:
		sprite.global_rotation = 0
		sprite.global_scale = Vector2(1,1)
	emit_signal("initialize")
func _physics_process(delta):
	move_and_slide(velocity)
	
	if get_slide_count():
		_on_wall_collision(get_slide_collision(0))



func _on_wall_collision(collision: KinematicCollision2D) -> void:
	hit()


func hit():
	queue_free()
	bullet_hit.show()
	bullet_hit.play()
	NodeUtils.reparent_keep_transform(bullet_hit,get_parent())

