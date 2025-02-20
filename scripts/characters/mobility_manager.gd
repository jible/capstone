extends Node
class_name MobilityManager

@onready var character = get_parent()
@onready var state_machine = character.state_machine

@export var max_speed = 1000
@export var acceleration = 100 
@export var drag = .9
var input_direction = Vector2.ZERO
var max_speed_mult: float = 0
var max_accel_mult: float = 0
	
func _physics_process(delta):
	call_deferred("update_velocity")

func set_velocity(arg):
	character.velocity = arg


# TODO
# Refactor to make these calculations when the state changes, not every frame.
func update_velocity():
	var current_state = state_machine.current_state_node

	var true_max_speed = max_speed * (current_state.movement_details.get("max_speed_mult", 1) + max_speed_mult)
	var true_acceleration = acceleration * (current_state.movement_details.get("acceleration_mult", 1) + max_accel_mult)
	var true_drag = drag * current_state.movement_details.get("drag_mult", 1)
	
	var movement_details = current_state.movement_details
	if movement_details.get("moveable", true):
		set_velocity(character.velocity + (input_direction * (acceleration + max_accel_mult)))
	if movement_details.get("use_drag", true):
		character.velocity *= true_drag
	if movement_details.get("limit_velocity", true):
		character.velocity = character.velocity.limit_length(true_max_speed)
	if character.velocity.length() < 5:
		character.velocity = Vector2.ZERO

func increase_max_speed_mult(mult: float):
	max_speed_mult += mult

func increase_max_accel_mult(mult: float):
	max_accel_mult += mult
