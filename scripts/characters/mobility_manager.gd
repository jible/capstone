extends Node
class_name MobilityManager

# Exports
# These are the character movement attributes before applying any multipliers
# We hold onto the originals because we need them everytime an attribute changes
@export var base_max_speed = 1000
@export var base_acceleration = 100 
@export var base_drag = .9

# Other variables
@onready var character = get_parent()
var current_state
var input_direction = Vector2.ZERO
var max_speed_mult: float = 0
var max_accel_mult: float = 0

# These mobility attributes consider the upgrade multipliers and current state multipliers
# These are the variables that should be used for velocity manipulation
var true_max_speed: float
var true_acceleration: float
var true_drag: float


func _physics_process(delta):
	# This has to wait a frame because the references are not established in the first frame
	call_deferred("update_velocity",delta)

# Not sure if another script calls this function, but I don't know if its necessary
func set_velocity(arg):
	character.velocity = arg


func calculate_true_values():
	true_max_speed = base_max_speed * (current_state.movement_details.get("max_speed_mult", 1) + max_speed_mult)
	true_acceleration = base_acceleration * (current_state.movement_details.get("acceleration_mult", 1) + max_accel_mult)
	true_drag = base_drag * current_state.movement_details.get("drag_mult", 1)

# Drag calculation improved using chatgpt:
# https://chatgpt.com/share/67c7f001-6d7c-8000-be46-b718f7e294c8
# https://chatgpt.com/share/67cd3f8f-53a4-8012-a72f-04df4b161be2
func update_velocity(delta):
	# TODO change drag calculation to use delta
	var movement_details = current_state.movement_details
	if movement_details.get("moveable", true):
		character.velocity = character.velocity + (input_direction * true_acceleration)
	if movement_details.get("use_drag", true):
		character.velocity -= character.velocity * (1 -true_drag ) * (delta * 60)
	if movement_details.get("limit_velocity", true):
		character.velocity = character.velocity.limit_length(true_max_speed)
	if character.velocity.length() < 5:
		character.velocity = Vector2.ZERO


func increase_max_speed_mult(mult: float):
	max_speed_mult += mult
	calculate_true_values()

func apply_impulse(impulse_vector):
	character.velocity += impulse_vector

func increase_max_accel_mult(mult: float):
	max_accel_mult += mult
	calculate_true_values()

func _on_state_machine_state_changed(new_state):
	current_state = new_state
	calculate_true_values()
