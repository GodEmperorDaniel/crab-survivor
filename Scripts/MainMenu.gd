extends Control

@export var scene_change : PackedScene
@onready var main_game_button : Button = $CanvasLayer/Buttons/MainGame
var main_game_button_font_size = 50 
@onready var credits_button: Button = $CanvasLayer/Buttons/Credits
var credits_button_font_size = 30
@onready var return_to_menu_button : Button = $CanvasLayer/Credits/ReturnButton
var return_to_menu_button_font_size = 50

## OUR NAMES BOB
@onready var credit_top_label : Label = $CanvasLayer/Credits/VBoxContainer/Top
var credit_top_label_font_size = 30
@onready var axel_label : Label = $CanvasLayer/Credits/VBoxContainer/Axel
var axel_label_font_size = 25
@onready var jonathan_label : Label = $CanvasLayer/Credits/VBoxContainer/Jonathan
var jonathan_label_font_size = 25

@onready var kenny_label : Label = $CanvasLayer/Credits/VBoxContainer/Kenny
var kenny_label_font_size = 25

@onready var main = $CanvasLayer/Buttons
@onready var credits = $CanvasLayer/Credits

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var time : float = 0.0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time+=delta
	main_game_button.add_theme_font_size_override("font_size", sin(time * 4) * 10 + main_game_button_font_size)
	credits_button.add_theme_font_size_override("font_size", sin(time * 4) * 10 + credits_button_font_size)
	return_to_menu_button.add_theme_font_size_override("font_size", sin(time * 4) * 10 + return_to_menu_button_font_size)
	
	credit_top_label.label_settings.font_size = sin(time * 4) * 10 + credit_top_label_font_size
	axel_label.label_settings.font_size = sin(time * 4) * 10 + axel_label_font_size
	jonathan_label.label_settings.font_size = sin(time * 4) * 10 + jonathan_label_font_size
	kenny_label.label_settings.font_size = sin(time * 4) * 10 + kenny_label_font_size


func _on_button_down_credits():
	main.visible = false
	credits.visible = true

func _on_button_down_start_game():
	get_tree().change_scene_to_packed(scene_change)


func _on_return_button_button_down():
	main.visible = true
	credits.visible = false
