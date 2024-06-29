extends RigidBody2D

@export var speed := 100
@export var damage := 50

func _physics_process(delta):
	var collision := move_and_collide(-global_transform.y * speed * delta)
	if collision != null:
		var collider := collision.get_collider()
		if collider is Enemy:
			collision.get_collider().attack(damage)
		
		queue_free()
