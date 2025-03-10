extends Control
# TODO: Find out if player is playing the game for the first time to show this scene and/or include button in the main menu for rewatch.
@export var tutor_vids : Array[VideoStreamTheora]
@export var tutor_pics : Array[TextureRect]
@export var tutor_text : Label
@export var movie : VideoStreamPlayer
@export var game_scene : String = "res://scenes/prefabs/scene_config_package.tscn"
@export var main_menu_scene : String = "res://scenes/testScenes/main_menu.tscn"
@export var text_bank : Array[String]
@export var top_position : Marker2D
@export var bottom_position : Marker2D

var label_positions : Dictionary

var current_slide = 0
var total_vids

func _ready():
	label_positions = {
	0 : top_position,
	1 : top_position,
	2 : top_position,
	3 : bottom_position,
	4 : top_position,
	5 : top_position,
	6 : bottom_position,
	7 : top_position,
	8 : top_position,
	}
	total_vids = text_bank.size()
	show_slide()

func _on_next_button_up():
	current_slide += 1
	if(current_slide >= total_vids):
		Globals.change_scene(load (game_scene) )
	else:
		show_slide()

func _on_previous_button_up():
	current_slide -= 1
	# Hitting back on the first slide takes you to the main menu, can block input if needed.
	if(current_slide < 0):
		Globals.change_scene(load (main_menu_scene) )
	else:
		show_slide()

func _on_skip_button_up():
	Globals.change_scene(load (game_scene) )

func show_slide():
	movie.stream = tutor_vids[current_slide]
	tutor_text.text = text_bank[current_slide]
	tutor_text.set_position(label_positions[current_slide].position)
	movie.play()
	
