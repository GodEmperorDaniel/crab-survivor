extends Control

signal item_bought(item : String)
		
func _ready():
	for child in get_children():
		if child is ShopItem:
			child.attempt_buy.connect(_attempt_buy_item)

func _attempt_buy_item(item : ShopItem):
	if Player.coins >= item.item_cost:
		item_bought.emit(item.item_name)
		Player.coins -= item.item_cost
