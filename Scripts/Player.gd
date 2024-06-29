extends CharacterBody2D

signal coin_picked_up
@export var speed : float = 1
@export var bow : PackedScene
@export var bomb : PackedScene
@onready var animation = $Animation
@onready var health_bar = $HealthBar

var bombs : int = 0 :
	get:
		return bombs
	set(new_value):
		bombs = new_value
		HUD.bombs = new_value
		print(bombs)

var coins : int = 0 :
	get:
		return HUD.coins
	set(new_value):
		HUD.coins = new_value

var movement : Vector2 = Vector2.ZERO

func _ready():
	HUD.item_bought.connect(_item_bought)

func _process(delta):
	process_movement()

func process_movement():
	movement = Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		movement.x -= speed
	if Input.is_action_pressed("move_right"):
		movement.x += speed
	
	if Input.is_action_pressed("move_up"):
		movement.y -= speed
	if Input.is_action_pressed("move_down"):
		movement.y += speed
	
	if movement.length_squared() > 0:
		movement_started()
	else:
		movement_stopped()
	
func _physics_process(delta):
	move_and_collide(movement * delta)
	
func _input(event):
	if event.is_action_pressed("bomb") and bombs > 0:
		create_bomb()
		bombs -= 1

func create_bomb():
	var new_bomb := bomb.instantiate()
	new_bomb.position = position
	add_sibling(new_bomb)

func movement_started():
	animation.play("running")
	animation.flip_h = movement.x < 0

func movement_stopped():
	animation.stop()

func attack(damage):
	health_bar.health -= damage

func _on_died():
	queue_free()

func _on_coin_picked_up():
	coins += 1

func _item_bought(item : String):
	print(item)
	if item == "Bomb":
		print("We now have", bombs, "bombs")
		bombs += 1
