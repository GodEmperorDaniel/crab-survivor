extends Marker2D

@export var aim_offset : float = 0
@export var animation_offset : float = 0
@export var bow : PackedScene
@onready var weapon = $Axe

var got_bow : bool = false

var attack_start_rotation := 0

func _ready():
	HUD.item_bought.connect(_item_bought)

func _process(delta):
	rotation = calculate_look_position() + deg_to_rad(animation_offset) + deg_to_rad(aim_offset)
	
func calculate_look_position():
	var mouse_pos := get_viewport().get_mouse_position() - get_viewport_rect().size / 2
	var delta := (Vector2(mouse_pos)).normalized()
	
	return atan2(delta.y, delta.x)


func _on_attack_initiated():
	attack_start_rotation = calculate_look_position()

func _item_bought(item):
	if item == "Bow":
		if(got_bow):
			var bow = weapon as Bow
			bow.decrease_shoot_timer()
		else:
			got_bow = true
			weapon.queue_free()
			weapon = bow.instantiate()
			weapon.position.x = 12
			add_child(weapon)
