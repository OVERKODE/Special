extends Node3D

@onready var cam = $cam_on_lesson
@onready var player = $player/camera
@onready var text = $player/canvas/Label
	
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("action"):
		player.current = true
		cam.current = false
		text.visible = false
		$player/canvas/Label2.visible = false
	var look = $player/camera/look
	if look.is_colliding():
		var object = look.get_collider()
		if object.name == "players_desk" and Input.is_action_just_pressed("interact"):
			$arrow.visible = false
			player.current = false
			cam.current = true
			$s1.visible = true
			$s2.visible = true
			$s3.visible = true
			$s4.visible = true
			$s5.visible = true
			$s6.visible = true
			$s7.visible = true
			$s8.visible = true
			$s9.visible = true
			$s10.visible = true
			$s11.visible = true
			$Timer.start()

func _on_timer_timeout() -> void:
	text.text = 'I have to go to the toilet.'
	text.visible = true
	$player/canvas/Label2.visible = true
