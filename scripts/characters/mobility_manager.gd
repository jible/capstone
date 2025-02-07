extends Node

@onready var character = get_parent()
@export var state_machine: Node

@export var max_speed = 1000
var acceleration = 100 
var default_drag = .9
var input_direction = Vector2.ZERO


func _physics_process(delta):
	update_velocity()
	
func set_velocity(arg):
	character.velocity = arg

func update_velocity():
	var current_state = state_machine.current_state_node
	# TODO
	# Set up player speed equation
	var true_max_speed = max_speed * current_state.movement_details.get("max_speed_mult", 1)
	var true_acceleration = acceleration * current_state.movement_details.get("acceleration_mult", 1)
	var drag = current_state.movement_details.get("drag", default_drag)
	
	var movement_details = current_state.movement_details
	if movement_details.get("moveable", true):
		set_velocity(character.velocity + (input_direction * acceleration))
	if movement_details.get("use_drag", true):
		character.velocity *= drag
	if movement_details.get("limit_velocity", true):
		character.velocity = character.velocity.limit_length(max_speed)
		print(character.velocity)
	if character.velocity.length() < 5:
		character.velocity = Vector2.ZERO
