extends CanvasLayer

signal item_bought(item: String)

@onready var _amount_text := $HUD/Cash/Amount
@onready var _shop := $Shop

var coins : int = 0 :
	get:
		return coins
	set(new_value):
		coins = new_value
		_amount_text.text = str(coins)

func open_shop():
	_shop.visible = true

func _on_panel_container_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		_shop.visible = false
		item_bought.emit("bow")
