extends Node2D

var main_menu_scene: PackedScene = preload("res://scenes/testScenes/main_menu.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	game_start_routine()
	Globals.change_scene(main_menu_scene)

func game_start_routine():
	SaveHandler.load_game()
