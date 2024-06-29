extends Control
class_name ShopItem

signal attempt_buy(item : ShopItem)

@export var item_name : String
@export var item_cost : int = 3
@export var item_icon : Texture2D
@export var is_item_consumable : bool

@onready var _name := $Container/Details/Name
@onready var _icon := $Container/Details/Icon
@onready var _cost := $Container/Details/Cost/Amount

func _ready():
	_name.text = item_name
	_icon.texture = item_icon
	_cost.text = str(item_cost)

func _on_details_input(event):
	if event is InputEventMouseButton:
		attempt_buy.emit(self)
