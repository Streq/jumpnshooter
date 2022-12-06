extends Label

var full_text := ""



func say(request:TextRequest):
	full_text = request.text
	text = ""
	var character_index = 0
	while full_text.length() != text.length():
		while get_line_count()-lines_skipped <= max_lines_visible and full_text.length() != text.length():
			character_index = show_next_visible_character(full_text, character_index)
			yield(get_tree().create_timer(0.1),"timeout")
		yield(self,"next")
		lines_skipped += max_lines_visible
		

func show_next_visible_character(full_text, character_index):
	var text_to_add = ""
	while character_index != full_text.length():
		var character = full_text[character_index]
		text_to_add += character
		character_index += 1
		if !(character in [" ", "\n"]):
			break
	text += text_to_add
	return character_index
	

func show_next_bit():
	if next_character_is_whitespace():
		add_next_word_to_text_and_hide_it()
	show_next_character()
	pass
func add_next_word_to_text_and_hide_it():
	pass
	
func show_next_character():
	pass
	
func next_character_is_whitespace():
	pass

func _physics_process(delta: float) -> void:
	pass


signal next()
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		emit_signal("next")
