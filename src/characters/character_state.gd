class_name CharacterState
extends State

var active := false
export var animation := ""
export var on_finish := ""

onready var character: KinematicBody2D = owner

var animation_player : AnimationPlayer
var input_state : InputState

func _ready():
	yield(owner,"ready")
	animation_player = owner.animation_player
	input_state = owner.input_state
	
	
func enter(params):
	active = true
	animation_player.play("RESET")
	animation_player.advance(0)
	animation_player.play(animation)
	animation_player.connect("animation_finished",self,"_on_animation_finished")
	.enter(params)
	
func exit():
	animation_player.disconnect("animation_finished",self,"_on_animation_finished")
	active = false
	.exit()

func _on_animation_finished(anim):
	if on_finish:
		goto(on_finish)
