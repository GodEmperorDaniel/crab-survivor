extends Sprite2D
class_name Weapon

signal attack_initiated
signal attack_finished

func _input(event):
	if event.is_action_pressed("attack"):
		attack_initiated.emit()
