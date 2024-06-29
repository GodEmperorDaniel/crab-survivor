extends Node

@export var spawn_locations : Array[Node2D] 

@export var waves : Array[EnemyWave] = []

var current_wave : int = 0

var spawning_done = false

var enemies_spawned_this_wave : int = 0

var timer : float = 0.0

@export var enemies : Array[Node] = []

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(spawning_done):
		return
	if(enemies_spawned_this_wave >= waves[current_wave].number_enemies):
		spawning_done = true
		return
	timer += delta
	if(timer >= waves[current_wave].spawn_frequency):
		timer = 0;
		var enemy = waves[current_wave].enemy_scene.instantiate()
		var random_index = randi_range(0,spawn_locations.size()-1)
		enemy.init(spawn_locations[random_index].position)
		enemies_spawned_this_wave+=1
		add_child(enemy)
		enemies.append(enemy)
		enemy.died.connect(_remove_from_enemies)

func _remove_from_enemies(enemy : Node):
	enemies.erase(enemy)
	if(enemies.size() == 0):
		_wave_completed()

func _wave_completed():
	if(current_wave < waves.size()-1):
		spawning_done = false
		enemies_spawned_this_wave = 0
		current_wave+=1
	else:
		print("you won!")
		pass

