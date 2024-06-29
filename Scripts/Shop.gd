extends PanelContainer

signal item_bought(item : String)

func _on_gui_input(event):
	if not event is InputEventMouseButton:
		return
	
	if Player.coins >= 3:
		Player.coins -= 3
		item_bought.emit("bow")
		visible = false
