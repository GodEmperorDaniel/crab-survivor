extends Weapon

@export var damage : float = 50
@onready var attack_box = $AttackArea
@onready var animation = $AxeAnimation

var hit_enemies : Array

func _on_attack_initiated():
	attack_box.process_mode = Node.PROCESS_MODE_INHERIT
	animation.play("swing_axe")

func _on_attack_landed(body):
	if not body is Enemy:
		return
	
	var enemy = body as Enemy
	
	if hit_enemies.has(enemy):
		return
	
	hit_enemies.append(enemy)
	enemy.attack(damage)


func _on_weapon_animation_finished(anim_name):
	attack_finished.emit()

func _on_attack_finished():
	attack_box.process_mode = Node.PROCESS_MODE_DISABLED
	hit_enemies.clear()
