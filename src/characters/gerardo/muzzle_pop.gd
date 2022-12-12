extends Sprite


onready var animation_player = $AnimationPlayer

func _ready() -> void:
	set_as_toplevel(true)

func _on_gun_shoot():
	global_transform = get_parent().global_transform
	animation_player.play("pop")
