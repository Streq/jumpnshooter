extends HBoxContainer
onready var profile_picture = $profile_picture
onready var profile_display_name = $profile_name
var profile_voice_stream_player: AudioStreamPlayer = null


func change_profile(request: TextRequest):
	var textbox = owner.textbox
	var profile_name = request.who
	var mood = request.mood
	
	if !profile_name:
		profile_picture.hide()
		profile_display_name.hide()
		return
	profile_display_name.set_text(profile_name)
	profile_picture.set_texture(null)
	if (
		profile_voice_stream_player
		and textbox.is_connected("character_shown", profile_voice_stream_player, "play")
	):
		textbox.disconnect("character_shown", profile_voice_stream_player, "play")
	
	
	if !DialogProfiles.map.has(profile_name):
		return
	
	var profile = DialogProfiles.map[profile_name]
	
	profile_picture.set_texture(profile.get_texture(mood))
	
	
	profile_picture.show()
	profile_display_name.show()
	
	profile_voice_stream_player = profile.get_voice(mood)
	
	if profile_voice_stream_player:
		textbox.connect("character_shown", profile_voice_stream_player, "play")
	
