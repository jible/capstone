extends Node2D

func _ready() -> void:
	# Prevent process interruption during scene transition.
	call_deferred("startGame")

## Starts the player in the first level, Limbo.
func startGame():
	get_tree().change_scene_to_file("res://scenes/limbo.tscn")

func _process(delta: float) -> void:
	pass
