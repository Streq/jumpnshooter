extends Node
onready var shake_anim: AnimationPlayer = $"../shake_anim"
onready var death_particles: CPUParticles2D = $"../death_particles"
onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
onready var behavior: Node = $"../behavior"
onready var touch_damager: Node2D = $"../pivot/touch_damager"

func trigger():
	touch_damager.disabled = true
	owner.set_physics_process(false)
	shake_anim.play("shake")
	death_particles.trigger()
	animation_player.stop()
	behavior.set_physics_process(false)
	owner.invulnerable = true
	owner.pass_through = true
	yield(get_tree().create_timer(2.0),"timeout")
	owner.die()
