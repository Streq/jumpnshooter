extends KinematicBody2D

export var speed := 200.0
onready var bullet_hit: Sprite = $bullet_hit


func _physics_process(delta):
	move_and_slide(Vector2.RIGHT.rotated(global_rotation)*200.0)
	if get_slide_count():
		_on_wall_collision(get_slide_collision(0))


func _on_Timer_timeout():
	queue_free()


func _on_wall_collision(collision: KinematicCollision2D) -> void:
	queue_free()
	bullet_hit.show()
	bullet_hit.play()
	NodeUtils.reparent_keep_transform(bullet_hit,get_parent())
