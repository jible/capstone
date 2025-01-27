extends CharacterBody2D


@onready var mobility_manager= $"Mobility Manager"


func _physics_process(_delta):
	mobility_manager.input_direction = InputManager.get_move_vector()
	move_and_slide()

func get_direction():
	return InputManager.get_look_vector(position)
