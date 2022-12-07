extends Label

var full_text := ""
var current_character_index := 0
var characters_skipped_count := 0
const whitespace_characters = [" ", "\n"]

func say(request:TextRequest):
	full_text = request.text
	text = ""
	var character_index = 0
	while full_text.length() != text.length():
		while get_line_count()-lines_skipped <= max_lines_visible and full_text.length() != text.length():
			character_index = show_next_visible_character(full_text, character_index)
			yield(get_tree().create_timer(0.5),"timeout")
		yield(self,"next")
		lines_skipped += max_lines_visible
		
func say_new(request:TextRequest):
	full_text = request.text
	current_character_index = 0
	characters_skipped_count = 0
	text = ""
	show_next_bit()
	
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
	while full_text.length() != text.length():
		var word_length = add_next_word_to_text_and_hide_it()
		var line_count = get_line_count()
		if line_count-lines_skipped > max_lines_visible:
			yield(self,"next")
			lines_skipped = line_count - (line_count % max_lines_visible)
			characters_skipped_count = get_total_character_count() - word_length
		
		var characters_in_panel_count = get_total_character_count() - characters_skipped_count
		
		visible_characters = characters_in_panel_count - word_length
		while visible_characters != characters_in_panel_count:
			show_next_character()
			yield(get_tree().create_timer(0.1),"timeout")

func add_next_word_to_text_and_hide_it():
	#add all whitespace between current index and next word
	var whitespace_count := 0
	while (
		current_character_index + whitespace_count != full_text.length() and 
		(full_text[current_character_index + whitespace_count] in whitespace_characters)
	):
		whitespace_count += 1
		
	#add all characters from next word
	var visible_character_count = 0
	while (
		current_character_index + whitespace_count + visible_character_count != full_text.length() and 
		!(full_text[current_character_index + whitespace_count + visible_character_count] in whitespace_characters)
	):
		visible_character_count += 1
	var word = full_text.substr(current_character_index, whitespace_count+visible_character_count)
	text += word
	current_character_index = text.length()
	print("word:", word)
	print("word_length:", visible_character_count)
	return visible_character_count
	pass
	
func show_next_character():
	visible_characters+=1
	
func next_character_is_whitespace()->bool:
	return full_text[current_character_index] in whitespace_characters


signal next()
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		emit_signal("next")
