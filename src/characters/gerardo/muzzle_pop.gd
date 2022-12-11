extends Sprite


onready var animation_player = $AnimationPlayer


func _on_gun_shoot():
	animation_player.play("pop")
