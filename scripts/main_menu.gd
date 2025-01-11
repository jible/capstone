extends Control

## The scene to transition to when the player hits "Start"
@export var scene_to_change : PackedScene

func _on_play_button_button_up() -> void:
	## Switch to the next scene without interuppting a process
	Globals.change_scene(scene_to_change)
