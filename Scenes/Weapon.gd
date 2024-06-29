extends Sprite2D

signal attack_initiated

@export var damage : float = 50
@onready var attack_box = $AttackArea

var attacking := false

var hit_enemies : Array

func _input(event):
	if event.is_action_pressed("attack"):
		attack_initiated.emit()

func _on_attack_animation_started(anim_name):
	attack_box.process_mode = Node.PROCESS_MODE_INHERIT
	attacking = true

func _on_attack_animation_finished(anim_name):
	attack_box.process_mode = Node.PROCESS_MODE_DISABLED
	attacking = false
	hit_enemies.clear()

func _on_attack_landed(body):
	if not body is Enemy:
		pass
	
	var enemy = body as Enemy
	
	if hit_enemies.has(enemy):
		pass
	
	hit_enemies.append(enemy)
	enemy.attack(damage)
