extends CharacterBody2D

const SPEED = 50

var player = Player
@onready var anim = $Animation

func _physics_process(delta):
	if(player == null):
		pass
	var direction = (player.position - position).normalized()
	if direction:
		anim.play("running")
		velocity = direction * SPEED

	move_and_slide()
