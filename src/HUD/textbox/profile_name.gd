extends Label


func set_text(val):
	text = val
	visible = text != "" and text != null
