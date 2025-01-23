extends Node2D

@export var char :CharacterBody2D
func pick_direction():
	return InputManager.get_look_vector(char.position)
