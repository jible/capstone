extends Node


@onready var player = get_parent().player
@export var action_sm: Node

func update_velocity(input_vector):
	player.velocity += input_vector * player.acceleration/ 2
	player.velocity *= player.drag
	player.velocity.limit_length(player.max_speed /2)


func enter_state():
	pass
func exit_state():
	pass
