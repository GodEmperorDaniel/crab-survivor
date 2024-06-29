extends Weapon

@onready var arrow := preload("res://Scenes/Arrow.tscn")
@onready var timer := $Timer

var can_shoot := true

func _on_attack_initiated():
	if can_shoot:
		timer.start()
		get_tree().root.add_child(arrow.instantiate())
