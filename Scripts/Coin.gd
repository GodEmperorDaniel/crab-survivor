extends Sprite2D

func _on_area_entered(body):
	if body != Player:
		return
	
	Player.coin_picked_up.emit()
	queue_free()
