extends Marker2D

@export var aim_offset : float = 0
@export var animation_offset : float = 0
#@onready var animation := $Weapon/WeaponAnimation

var attack_start_rotation := 0

func _process(delta):
	pass
	#if animation.is_playing():
		#rotation = attack_start_rotation + deg_to_rad(animation_offset)
	#else:
		#rotation = calculate_look_position() + deg_to_rad(animation_offset)
	#
	#rotation += deg_to_rad(aim_offset)
	
	rotation = calculate_look_position() + deg_to_rad(animation_offset) + deg_to_rad(aim_offset)
	
func calculate_look_position():
	var mouse_pos := get_viewport().get_mouse_position() - get_viewport_rect().size / 2
	var delta := (Vector2(mouse_pos)).normalized()
	
	return atan2(delta.y, delta.x)


func _on_attack_initiated():
	attack_start_rotation = calculate_look_position()
	#animation.play("swing_axe")
