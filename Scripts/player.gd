extends CharacterBody3D

var speed = 0.5
var sprint_speed = 1.5
var sensivity = 0.002
var rotation_x = 0
var rotation_y = 0
var task_is_completed = false
var check_window = false
@onready var animation = $animation
@onready var sprint = $run_sound

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _physics_process(delta: float) -> void:
	var move_dir = Vector3.ZERO
	if Input.is_action_pressed("move_forward"):
		move_dir += -transform.basis.z
	if Input.is_action_pressed("move_back"):
		move_dir += transform.basis.z
	if Input.is_action_pressed("move_left"):
		move_dir += -transform.basis.x
	if Input.is_action_pressed("move_right"):
		move_dir += transform.basis.x
		
	move_dir = move_dir.normalized()
	
	if move_dir:
		if Input.is_action_pressed("sprint") and Input.is_action_pressed("move_forward"):
			velocity.z = move_dir.z * sprint_speed
			velocity.x = move_dir.x * sprint_speed
			animation.play("sprint")
			
		else:
			velocity.z = move_dir.z * speed
			velocity.x = move_dir.x * speed
			animation.play("walk")
	else:
		velocity.x = 0
		velocity.z = 0
		animation.stop()
		sprint.stop()
		
	move_and_slide()
	
func _input(e: InputEvent) -> void:
	if e is InputEventMouseMotion:
		rotation_x -= e.relative.y * sensivity
		rotation_y -= e.relative.x * sensivity
		
		if rotation_x > 1: rotation_x = 1
		if rotation_x < -1: rotation_x = -1
		
		transform.basis = Basis(Vector3(0,1,0), rotation_y)
		$camera.transform.basis = Basis(Vector3(1,0,0), rotation_x)
