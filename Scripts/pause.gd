extends Node

var is_paused: bool = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		is_paused = !is_paused
	if is_paused == true:
		get_tree().paused = true
		$"../pause".visible = true
		$"../player/canvas".visible = false
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		get_tree().paused = false
		$"../pause".visible = false
		$"../player/canvas".visible = true
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
