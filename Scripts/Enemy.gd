extends CharacterBody2D
class_name Enemy

@export var speed = 50.0
@export var attack_range = 20
@export var attack_damage = 2.0
@export var attack_time = 0.5

var player = Player
@onready var anim = $Animation
@onready var health_bar = $HealthBar
var coin = preload("res://Scenes/Coin.tscn")

signal died(Node)

var vel = Vector2.ZERO

var col

func init(_position):
	position = _position

var timer = 0.0
func _process(delta):
	if(player == null):
		pass
	vel = Vector2.ZERO
	var direction = (player.position - position)
	if direction:
		if (direction.length() < attack_range):
			timer += delta
			if(timer >= attack_time):
				do_attack()
				timer = 0.0
		else:
			anim.play("running")
			vel = direction.normalized()

func _physics_process(delta):
	move_and_collide(vel * delta * speed)

func attack(damage):
	health_bar.health -= damage

func do_attack():
	player.attack(attack_damage)

func _on_died():
	died.emit(self)
	var new_coin := coin.instantiate()
	new_coin.position = position
	call_deferred("add_sibling",new_coin)
	queue_free()
