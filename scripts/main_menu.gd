extends Node2D

func _ready() -> void:
	# Prevent process interruption during scene transition.
	call_deferred("start_game")

## Starts the player in the first level, Limbo.
func start_game():
	get_tree().change_scene_to_file("res://scenes/limbo.tscn")

func _process(delta: float) -> void:
	pass
