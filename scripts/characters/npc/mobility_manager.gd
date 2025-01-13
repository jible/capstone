extends Node


@onready var character = get_parent()
@export var action_state_manager: Node

var default_max_speed = 1000
var default_acceleration = 100 

func _physics_process(delta):
	var direction = InputManager.get_move_vector()
	update_velocity(direction)
	
	
func update_velocity(direction):
	var current_state = action_state_manager.get_current_state_node()
	var acceleration = current_state.acceleration
	if !acceleration:
		acceleration = default_acceleration 
	var max_speed = current_state.max_speed
	if !max_speed:
		max_speed = default_max_speed 
	
	character.velocity += direction * acceleration
	character.velocity *= character.drag
	character.velocity.limit_length(max_speed)
	
	if character.velocity.length() < 5:
		character.velocity = Vector2.ZERO
