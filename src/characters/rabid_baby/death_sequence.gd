extends Node
onready var shake_anim: AnimationPlayer = $"../shake_anim"
onready var death_particles: CPUParticles2D = $"../death_particles"
onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
onready var behavior: Node = $"../behavior"
onready var touch_damager: Node2D = $"../pivot/touch_damager"
onready var explosions: Node2D = $"../explosions"

func trigger():
	touch_damager.disabled = true
	owner.set_physics_process(false)
	shake_anim.play("shake")
	death_particles.trigger()
	animation_player.stop()
	behavior.set_physics_process(false)
	owner.invulnerable = true
	owner.pass_through = true
	for i in 12:
		random_explosion()
		yield(get_tree().create_timer(0.166667),"timeout")
	owner.die()

var last_i = 0
func random_explosion():
	var i = randi()%(explosions.get_child_count()-1)
	if i >= last_i:
		i += 1
	last_i = i
	explosions.get_child(i).play()
