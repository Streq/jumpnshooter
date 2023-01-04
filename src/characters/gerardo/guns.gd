extends Node
signal gun_changed(gun)
signal gun_added(gun)

var guns := []
var index := 0

func _ready() -> void:
	yield(owner,"ready")
	for gun in get_children():
		guns.append(gun)
		remove_child(gun)
	
	owner.gun_hold.change_gun(guns[0])

func set_gun(index):
	self.index = posmod(index, guns.size())
	var gun = guns[self.index]
	owner.gun_hold.change_gun(gun)
	

func add_gun(gun):
	guns.append(gun)
	emit_signal("gun_added",gun)

func _physics_process(delta: float) -> void:
	var input : InputState = owner.input_state
	if input.L.is_just_pressed():
		set_gun(index-1)
	elif input.R.is_just_pressed():
		set_gun(index+1)
