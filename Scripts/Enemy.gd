extends CharacterBody2D
class_name Enemy

@export var speed = 50.0

var player = Player
@onready var anim = $Animation
@onready var health_bar = $HealthBar
var coin = preload("res://Scenes/Coin.tscn")

var vel = Vector2.ZERO

func init(_position):
	position = _position

func _process(delta):
	if(player == null):
		pass
	var direction = (player.position - position).normalized()
	if direction:
		anim.play("running")
		vel = direction * speed * delta

func _physics_process(delta):
	move_and_collide(vel)

func attack(damage):
	health_bar.health -= damage

func _on_died():
	var new_coin := coin.instantiate()
	new_coin.position = position
	add_sibling(new_coin)
	queue_free()
