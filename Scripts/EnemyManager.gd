extends Node

@export var spawn_locations : Array[Node2D] 

@export var enemy_scene : PackedScene

## frequency per second
@export var spawn_frequency = 0.5

var timer = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	if(timer >= spawn_frequency):
		var enemy = enemy_scene.instantiate()
		# Chose a random spawn location? 
		add_child(enemy)
