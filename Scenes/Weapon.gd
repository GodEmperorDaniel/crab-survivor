extends Sprite2D

func _input(event):
	if event.is_action_pressed("attack"):
		if event is InputEventMouseButton:
			attacked_at(event.position)

func attacked_at(position):
	print("Attacked position " + str(position))
