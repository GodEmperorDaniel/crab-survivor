extends Sprite2D

@export var damage = 100
@onready var explosion_area := $ExplosionArea
@onready var fuse := $Fuse

func _ready():
	fuse.start()

func _on_timer_timeout():
	var caught_bodies : Array[Node2D] = explosion_area.get_overlapping_bodies()
	
	for body in caught_bodies:
		if body is Enemy:
			body.attack(damage)
	
	queue_free()
