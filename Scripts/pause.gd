extends Node

var is_paused: bool = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		is_paused = !is_paused
	if is_paused == true:
		get_tree().paused = true
		$"../pause".visible = true
		$"../player/canvas".visible = false
	else:
		get_tree().paused = false
		$"../pause".visible = false
		$"../player/canvas".visible = true

func _on_exit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
