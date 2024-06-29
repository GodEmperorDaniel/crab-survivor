extends Sprite2D

func _on_area_entered(body):
	if not body is Player:
		pass
	
	(body as Player).coin_picked_up
