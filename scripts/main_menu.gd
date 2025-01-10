extends Node2D

## The scene to transition to when the player hits "Start"
@export var scene_to_change : PackedScene

func _ready() -> void:
	## Switch to the next scene without interuppting a process
	Globals.change_scene(scene_to_change)
