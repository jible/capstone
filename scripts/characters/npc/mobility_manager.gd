extends Node


@onready var character = get_parent()
@export var state_machine: Node

@export var default_max_speed = 1000
@export var default_acceleration = 100 
var input_direction = Vector2.ZERO

func _physics_process(delta):
	update_velocity(input_direction)
	
	
func update_velocity(direction):
	var current_state = state_machine.get_current_state_node()
	var acceleration = current_state.acceleration
	if acceleration < 0:
		acceleration = default_acceleration 
	var max_speed = current_state.max_speed
	if max_speed < 0:
		max_speed = default_max_speed 
	
	character.velocity += direction * acceleration
	character.velocity *= character.drag
	character.velocity.limit_length(max_speed)
	
	if character.velocity.length() < 5:
		character.velocity = Vector2.ZERO
