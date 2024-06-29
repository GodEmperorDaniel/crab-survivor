extends Weapon

@export var arrow : PackedScene
@onready var timer := $ShootTimer

var can_shoot := true

func _on_attack_initiated():
	if can_shoot:
		timer.start()
		create_arrow()
		can_shoot = false


func _on_shoot_timer_timeout():
	can_shoot = true

func create_arrow():
	var new_arrow := arrow.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
	new_arrow.global_rotation_degrees = global_rotation_degrees + 90
	new_arrow.position = global_position
	get_tree().root.add_child(new_arrow)
