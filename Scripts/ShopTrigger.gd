extends Area2D

func _on_body_entered(body):
	if body == Player:
		HUD.open_shop()
