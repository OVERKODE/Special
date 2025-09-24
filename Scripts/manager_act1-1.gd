extends Node3D

@onready var break_loop = $player/break_sound_loop

func _ready() -> void:
	break_loop.play("loop")
