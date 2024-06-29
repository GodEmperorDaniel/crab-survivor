extends CharacterBody2D
class_name Enemy

const SPEED = 50

var player = Player
@onready var anim = $Animation
@onready var health_bar = $HealthBar
var coin = preload("res://Scenes/Coin.tscn")

func _physics_process(delta):
	if(player == null):
		pass
	var direction = (player.position - position).normalized()
	if direction:
		anim.play("running")
		velocity = direction * SPEED

	move_and_slide()

func attack(damage):
	health_bar.health -= damage

func _on_died():
	var new_coin := coin.instantiate()
	new_coin.position = position
	add_sibling(new_coin)
	queue_free()
