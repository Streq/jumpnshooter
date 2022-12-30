extends HBoxContainer


onready var selected_panel: Sprite = $selected_panel

func _ready() -> void:
	pass

func _on_player_change_gun(gun) -> void:
	if selected_panel.is_inside_tree():
		selected_panel.get_parent().remove_child(selected_panel)
	for hud in get_children():
		var hud_name = hud.weapon_name
		var gun_name = gun.name
		if hud_name == gun_name:
			hud.add_child(selected_panel)
			continue
		
