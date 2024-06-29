extends Area2D

func _on_body_entered(body):
	if body == Player:
		HUD.toggle_shop(true)

func _on_body_exited(body):
	if body == Player:
		HUD.toggle_shop(false)
