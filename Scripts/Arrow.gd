extends RigidBody2D

@export var speed := 100

func _physics_process(delta):
	move_and_collide(global_transform.y * Vector2(-1, -1) * speed * delta)
