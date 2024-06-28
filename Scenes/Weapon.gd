extends Sprite2D

@onready var attack_box = $AttackArea
@onready var animation = $Animation

var attacking := false

func _input(event):
	if event.is_action_pressed("attack"):
		if event is InputEventMouseButton:
			attempt_attack(event.position)

func attempt_attack(position):
	if not attacking:
		animation.play("attack")

func _on_attack_animation_started(anim_name):
	attack_box.process_mode = Node.PROCESS_MODE_INHERIT
	attacking = true

func _on_attack_animation_finished(anim_name):
	attack_box.process_mode = Node.PROCESS_MODE_DISABLED
	attacking = false

func _on_attack_area_body_entered(body):
	print("Enemy hit")
