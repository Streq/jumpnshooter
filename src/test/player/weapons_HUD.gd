extends HBoxContainer

export var WEAPON_SELECT : PackedScene 

export var player_path : NodePath
onready var player = get_node(player_path)

onready var selected_panel: Sprite = $selected_panel

func _ready():
	follow_player(player)

func follow_player(player):
	var guns = player.get_node("%guns")
	guns.connect("gun_added", self,"_on_player_add_gun")
	player.connect("change_gun",self,"_on_player_change_gun")

func _on_player_change_gun(gun) -> void:
	if selected_panel.is_inside_tree():
		selected_panel.get_parent().remove_child(selected_panel)
	for hud in get_children():
		var hud_name = hud.weapon_name
		var gun_name = gun.name
		if hud_name == gun_name:
			hud.add_child(selected_panel)
			continue
		
func _on_player_add_gun(gun) -> void:
	var weapon = WEAPON_SELECT.instance()
	weapon.weapon_name = gun.name
	add_child(weapon)
