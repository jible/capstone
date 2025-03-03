extends Control

var main_menu: PackedScene = preload("res://scenes/testScenes/main_menu.tscn")

func _on_reset_pressed() -> void:
	# Start the Main Menu's music
	MusicManager.stop()
	MusicManager.change_song(MusicManager.MAIN_MENU)
	
	Globals.change_scene(main_menu)

func _on_quit_pressed() -> void:
	Globals.quit_game()
