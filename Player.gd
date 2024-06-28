extends Sprite2D

@export var speed : float = 1

var movement : Vector2 = Vector2.ZERO

func _process(delta):
	process_movement()
	position += movement * delta

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
