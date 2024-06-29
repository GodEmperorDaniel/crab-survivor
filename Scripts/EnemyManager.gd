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
		timer = 0;
		var enemy = enemy_scene.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
		var random_index = randi_range(0,spawn_locations.size()-1)
		enemy.init(spawn_locations[random_index].position)
		add_child(enemy)


