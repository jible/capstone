extends Control

## The scene to transition to when the player hits "Start"
@export var path_to_scene : String = "res://scenes/prefabs/scene_config_package.tscn"
@onready var play_button: Button = $"PlayButton"
@export var options_menu: PackedScene

func _ready() -> void:
	play_button.grab_focus()

func _on_play_button_button_up() -> void:
	## Switch to the next scene without interuppting a process
	Globals.change_scene(load (path_to_scene) )

func _on_tutorial_button_button_up():
	Globals.change_scene(load ("res://scenes/tutorial.tscn") )

func _on_options_button_pressed() -> void:
	var options_instance = options_menu.instantiate()
	add_child(options_instance)
