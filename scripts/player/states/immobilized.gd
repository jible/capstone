extends Node

@onready var player = get_parent().player

func update_velocity(input_vector):
	player.velocity = Vector2.ZERO
	
func enter_state():
	pass
func exit_state():
	pass
