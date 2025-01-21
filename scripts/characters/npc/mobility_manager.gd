extends Node


@onready var character = get_parent()
@export var state_machine: Node

@export var max_speed = 100
@export var acceleration = 10 
var input_direction = Vector2.ZERO

func _physics_process(delta):
	update_velocity(input_direction)
	
	
func update_velocity(direction):
	
	
	var current_state = state_machine.get_current_state_node()
	character.velocity += direction * acceleration
	character.velocity *= character.drag
	character.velocity.limit_length(max_speed)
	
	if character.velocity.length() < 5:
		character.velocity = Vector2.ZERO
