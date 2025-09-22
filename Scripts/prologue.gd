extends Control

@onready var text = $text
var fullText = "I was an ordinary guy like everyone else."
@onready var timer = $Timer
var i = 0
var msg_num = 0

func _ready() -> void:
	timer.start()

func _on_timer_timeout() -> void:
	if msg_num == 0 and i <= 40:
		text.text += fullText[i]
		timer.start()
		i += 1
	if msg_num == 1 and i <= 50:
		text.text += fullText[i]
		timer.start()
		i += 1
	if msg_num == 2 and i <= 29:
		text.text += fullText[i]
		timer.start()
		i += 1 

	if (i == 41 and msg_num == 0):
		if Input.is_action_pressed("continue"):
			msg_num += 1
			fullText = "But people were hating me because I used to be gay."
			text.text = ""
			i = 0
			timer.start()
	if (i == 51 and msg_num == 1):
		if Input.is_action_pressed("continue"):
			msg_num += 1
			fullText = "But now I don't care about it."
			text.text = ""
			i = 0
			timer.start()
	if (i == 30 and msg_num == 2):
		if Input.is_action_pressed("continue"):
			get_tree().change_scene_to_file("res://Scenes/menu.tscn")
