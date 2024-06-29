extends Marker2D

@export var animation_offset := 0
@onready var animation := $WeaponAnimation

func _process(delta):
	#print(get_viewport().get_mouse_position() - get_viewport_rect().size / 2)
	rotation = calculate_look_position()
	
func calculate_look_position():
	var mouse_pos := get_viewport().get_mouse_position() - get_viewport_rect().size / 2
	var delta := (Vector2(mouse_pos)).normalized()
	
	return atan2(delta.y, delta.x)


func _on_attack_initiated():
	animation.play("attack")
