extends CanvasLayer

signal item_bought(item: String)

@onready var _amount_text := $HUD/VBoxContainer/Cash/Amount
@onready var _shop := $HUD/Shop
@onready var _wave_clear := $WaveCleared
@onready var _victory_screen := $Victory
@onready var _bombs := $HUD/VBoxContainer/Bombs/Amount

var bombs : int = 0 :
	get: 
		return bombs
	set(new_value):
		bombs = new_value
		_bombs.text = str(bombs)

var coins : int = 0 :
	get:
		return coins
	set(new_value):
		coins = new_value
		_amount_text.text = str(coins)

func toggle_shop(toggle_on : bool):
	_shop.visible = toggle_on

func toggle_wave_cleared_control(toggle_on : bool):
	_wave_clear.visible = toggle_on

func toggle_victory_screen(toggle_on : bool):
	_victory_screen.visible = toggle_on

func _on_shop_item_bought(item):
	item_bought.emit(item)
