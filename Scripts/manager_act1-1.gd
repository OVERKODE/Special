extends Node3D

@onready var break_loop = $player/break_sound_loop
@onready var text = $player/canvas/text
@onready var timer = $player/canvas/Timer

func _ready() -> void:
	break_loop.play("loop")
	
func _physics_process(delta: float) -> void:
	var look = $player/camera/look
	if look.is_colliding():
		var object = look.get_collider()
		if object.name == "ClassDoor" and Input.is_action_just_pressed("interact"):
			$door.play()
			get_tree().change_scene_to_file("res://Scenes/act_1_2.tscn")
		if object.name != "ClassDoor" and Input.is_action_just_pressed("interact"):
			text.visible = true
			timer.start()

func _on_timer_timeout() -> void:
	text.visible = false
