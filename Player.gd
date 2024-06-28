extends CharacterBody2D

@export var speed : float = 1
@onready var animation = $Animation

var movement := Vector2.ZERO

func _process(delta):
	process_movement()
	
func _physics_process(delta):
	move_and_collide(movement * speed * delta)

func process_movement():
	movement = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down"))
	
	if movement.length_squared() > 0:
		movement_started()
	else:
		movement_stopped()

func movement_started():
	animation.play("running")
	animation.flip_h = movement.x < 0

func movement_stopped():
	animation.stop()
