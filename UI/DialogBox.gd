extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var dialog
var line 
var is_player

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_visible_characters(0)
	dialog = ["Some memes", "Memes are great"]
	set_up_dialog(dialog, true)
	set_process_input(true)
	
func set_up_dialog(dialog_text, is_player_bool):
	dialog = dialog_text
	is_player = is_player_bool
	line = 0
	text = dialog[line]
	if is_player:
		add_color_override("font_color", Color(.68, .03, .62))
	else:
		add_color_override("font_color", Color(255, 255, 255))
	

func _input(input):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) or Input.is_mouse_button_pressed(BUTTON_RIGHT) \
	or Input.is_key_pressed(KEY_ENTER):
		if get_visible_characters() > get_total_character_count():
			if line < dialog.size() - 1:
				line += 1
				text = dialog[line]
				set_visible_characters(0)
			else:
				$"..".hide()
				$"..".queue_free()
		else:
			set_visible_characters(get_total_character_count()) 

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
