extends CanvasLayer

signal item_bought(item: String)

@onready var _amount_text := $HUD/Cash/Amount
@onready var _shop := $Shop
@onready var _wave_clear := $WaveCleared

var coins : int = 0 :
	get:
		return coins
	set(new_value):
		coins = new_value
		_amount_text.text = str(coins)

func open_shop():
	_shop.visible = true

func toggle_wave_cleared_control(toggle_on : bool):
	_wave_clear.visible = toggle_on


func _on_shop_item_bought(item):
	item_bought.emit(item)
