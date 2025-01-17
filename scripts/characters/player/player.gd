class_name Player
extends Node2D

@export var mobility_manager : Node
@export var character: CharacterBody2D

func _ready():
	Globals.player = $"Character Base Class"
	
func _physics_process(delta):
	mobility_manager.input_direction = InputManager.get_move_vector()
