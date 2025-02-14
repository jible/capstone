extends Control

## The scene to transition to when the player hits "Start"
@export var path_to_scene : String = "res://scenes/limbo.tscn"

func _on_play_button_button_up() -> void:
	## Switch to the next scene without interuppting a process
	Globals.change_scene(load (path_to_scene) )
