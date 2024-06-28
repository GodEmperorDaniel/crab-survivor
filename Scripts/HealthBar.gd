extends HSlider

signal owner_died
@export var health : float = 100 : 
	get:
		return health
	set(new_value):
		health = new_value
		value = new_value
		
		if health <= 0:
			owner_died.emit()
