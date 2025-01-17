extends Node

@onready var player = get_parent()
@export var action_state_manager: Node

var default_max_speed = 1000
var default_acceleration = 100 


func _physics_process(delta):
	var input_vector = InputManager.get_move_vector()
	update_velocity(input_vector)

func update_velocity(input_vector):
	var current_state = action_state_manager.get_current_state_node()
	var acceleration = current_state.acceleration
	if acceleration < 0:
		acceleration = default_acceleration 
	var max_speed = current_state.max_speed
	if max_speed < 0:
		max_speed = default_max_speed 
	
	player.velocity += input_vector * acceleration
	player.velocity *= player.drag
	player.velocity.limit_length(max_speed)
	
	if player.velocity.length() < 5:
		player.velocity = Vector2.ZERO
		
