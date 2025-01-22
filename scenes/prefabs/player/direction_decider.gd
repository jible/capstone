extends Node2D

@export var char :CharacterBody2D
func pick_direction():
	return char.velocity
