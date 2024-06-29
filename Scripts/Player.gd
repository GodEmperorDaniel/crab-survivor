extends CharacterBody2D

@export var speed : float = 1
@onready var animation = $Animation

var movement : Vector2 = Vector2.ZERO

func _process(delta):
	process_movement()
	
func _physics_process(delta):
	move_and_collide(movement * speed * delta)

func process_movement():
	movement = Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		movement.x -= speed
	if Input.is_action_pressed("move_right"):
		movement.x += speed
	
	if Input.is_action_pressed("move_up"):
		movement.y -= speed
	if Input.is_action_pressed("move_down"):
		movement.y += speed
	
	if movement.length_squared() > 0:
		movement_started()
	else:
		movement_stopped()

func movement_started():
	animation.play("running")
	animation.flip_h = movement.x < 0

func movement_stopped():
	animation.stop()

func _on_died():
	queue_free()
