extends Sprite
signal started()
onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	queue_free()

func play():
	animation_player.play("main")
	emit_signal("started")
