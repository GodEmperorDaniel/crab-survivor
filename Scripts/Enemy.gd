extends CharacterBody2D
class_name Enemy

@export var speed = 50.0
@export var attack_range = 20
@export var attack_damage = 2.0
@onready var timer = $Timer

var player = Player
@onready var anim = $Animation
@onready var health_bar = $HealthBar
var coin = preload("res://Scenes/Coin.tscn")

var vel = Vector2.ZERO

var col

func init(_position):
	position = _position

func _process(delta):
	if(player == null):
		pass
	vel = Vector2.ZERO
	var direction = (player.position - position)
	if direction:
		if (direction.length() < attack_range and timer.paused):
			print("started attack timer")
			timer.start(1)
		else:
			anim.play("running")
			vel = direction.normalized()

func _physics_process(delta):
	move_and_collide(vel * delta * speed)

func attack(damage):
	health_bar.health -= damage

func do_attack():
	print("attacked")
	player.attack(attack_damage)

func _on_died():
	var new_coin := coin.instantiate()
	new_coin.position = position
	call_deferred("add_sibling",new_coin)
	queue_free()
