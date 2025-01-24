extends Node

@onready var player = get_parent()
@export var state_machine: Node

var default_max_speed = 1000
var default_acceleration = 100 
var default_drag = .9


func _physics_process(delta):
	update_velocity(InputManager.get_move_vector())
	
func set_velocity(arg):
	player.velocity = arg

func update_velocity(input_vector):
	var current_state = state_machine.current_state_node
	var acceleration = current_state.movement_details.get("acceleration", default_acceleration)
	var max_speed = current_state.movement_details.get("max_speed", default_max_speed)
	var drag = current_state.movement_details.get("drag", default_drag)
	
	var movement_details = current_state.movement_details
	if movement_details.get("moveable", true):
		set_velocity(player.velocity + (input_vector * acceleration))
	if movement_details.get("use_drag", true):
		player.velocity *= drag
	if movement_details.get("limit_velocity", true):
		player.velocity.limit_length(max_speed)
	if player.velocity.length() < 5:
		player.velocity = Vector2.ZERO
