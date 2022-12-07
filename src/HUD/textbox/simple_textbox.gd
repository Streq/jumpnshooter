extends Label
signal panel_started
signal panel_finished
signal text_started
signal text_finished
signal character_shown
signal next

var full_text := ""
var current_character_index := 0
var characters_skipped_count := 0
var skip_panel_animation= false
const whitespace_characters = [" ", "\n"]
const break_character = "<br>"
onready var continues_icon = $continues_icon

func say(request:TextRequest):
	full_text = request.text
	current_character_index = 0
	characters_skipped_count = 0
	text = ""
	show_text()

func show_text():
	show()
	emit_signal("text_started")
	emit_signal("panel_started")
	while full_text.length() != current_character_index:
		#add whole next word to prevent line break changes mid display
		#(further explained below)
		var word_length = add_next_word_to_text()
		var line_count = get_line_count()
		
		#if panel finished
		if line_count > max_lines_visible:
			#yield for input to continue
			emit_signal("panel_finished")
			yield(self,"next")
			#change panel
			skip_panel_animation = false
			
			characters_skipped_count = get_total_character_count() - word_length
			emit_signal("panel_started")
			trim_leading_whitespace_for_last_word()
			
#		var characters_in_panel_count = get_total_character_count() - characters_skipped_count
		var characters_in_panel_count = get_total_character_count()
		
		#hide last word from display (this is all done to prevent changes in the
		#character that causes the line break)
		#if we started just adding characters one by one
		#the line would break like this
		#frame 0:
		"""hello my name is santiaguit""" #line not broken yet
		#frame1:
		"""hello my name is
		santiaguito""" #line broken AFTER the word started showing
		#but with the current system it goes
		#frame 0:
		"""hello my name is
		santiaguit""" #line is broken already cause "o" is present but hidden
		#frame 1:
		"""hello my name is
		santiaguito"""
		visible_characters = characters_in_panel_count - word_length
		
		#start showing last word character by character
		while visible_characters != characters_in_panel_count:
			show_next_character()
			#flag to skip the animation if the user pressed A
			if !skip_panel_animation:
				emit_signal("character_shown")
				yield(get_tree().create_timer(0.025),"timeout")
				
	yield(self,"next")
	hide()
	emit_signal("text_finished")
	

#returns word length (excluding previous whitespace)
func add_next_word_to_text()->int:
	#add all whitespace between current index and next word
	var any_character_count := 0
	while (
		current_character_index + any_character_count != full_text.length() and 
		(full_text[current_character_index + any_character_count] in whitespace_characters)
	):
		any_character_count += 1
	
	var word_length := 0
		
	#add all characters from next word
	while (
		current_character_index + any_character_count != full_text.length() and 
		!(full_text[current_character_index + any_character_count] in whitespace_characters)
	):
		any_character_count += 1
		word_length += 1
	var word = full_text.substr(current_character_index, any_character_count)
	text += word
	current_character_index += any_character_count
	print("word:", word)
	print("word_length:", word_length)
	return word_length

func show_next_character():
	visible_characters+=1
	
func next_character_is_whitespace()->bool:
	return full_text[current_character_index] in whitespace_characters


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		skip_panel_animation= true
		emit_signal("next")

func trim_leading_whitespace_for_last_word():
	var reached_whitespace = false
	
	var whitespace_end := 0
	var whitespace_start := 0
	for i in range(text.length()-1, -1, -1):
		if text[i] in whitespace_characters:
			reached_whitespace = true
			whitespace_end = posmod(i,text.length())
			break
	if reached_whitespace:
		for i in range(whitespace_end, -1, -1):
			if !(text[i] in whitespace_characters):
				break
			whitespace_start = i
	var left_half = text.substr(0,whitespace_start)
	var right_half = text.substr(whitespace_end+1)
	print("text:", text)
	print("left_half:",left_half)
	print("right_half:",right_half)
	text = right_half
