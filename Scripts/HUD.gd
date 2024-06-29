extends CanvasLayer

@onready var _amount_text := $HUD/Cash/Amount
var coins : int = 0 :
	get:
		return coins
	set(new_value):
		coins = new_value
		_amount_text.text = str(coins)
