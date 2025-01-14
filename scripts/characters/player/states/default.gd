extends Node

@onready var player = get_parent().player

func update_velocity(input_vector):
	player.velocity += input_vector * player.acceleration
	player.velocity *= player.drag
	player.velocity.limit_length(player.max_speed)

func enter_state():
	pass
func exit_state():
	pass
