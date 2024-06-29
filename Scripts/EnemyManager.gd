extends Node

@export var spawn_locations : Array[Node2D] 

@export var waves : Array[EnemyWave] = []

var current_wave : int = 0

var wave_multiplier : int = 1

var spawning_done = false

var enemies_spawned_this_wave : int = 0

var timer : float = 0.0

var hud = HUD

var hud_opened : bool = false

var won : bool = false

@export var enemies : Array[Node] = []

@onready var scene_change = "res://Scenes/Main_Menu.tscn"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(spawning_done):
		return
	if(enemies_spawned_this_wave >= waves[current_wave].number_enemies * wave_multiplier):
		spawning_done = true
		return
	timer += delta
	if(timer * wave_multiplier >= waves[current_wave].spawn_frequency):
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
		hud.toggle_wave_cleared_control(true)
		hud_opened = true
	else:
		hud.toggle_victory_screen(true)
		won = true
		pass

func _input(event):
	if(event.is_action_pressed("ready_next_wave")):
		if(hud_opened):
			hud.toggle_wave_cleared_control(false)
			enemies_spawned_this_wave = 0
			current_wave+=1
			hud_opened = false
			spawning_done = false
		elif(won):
			current_wave=0
			hud.toggle_victory_screen(false)
			won = false
			enemies_spawned_this_wave = 0
			wave_multiplier*=2
			spawning_done = false
	elif(event.is_action_pressed("return_to_menu")):
		get_tree().change_scene_to_file(scene_change)
