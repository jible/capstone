extends Node



@export var player: CharacterBody2D
@export var default_state: String = ""

var state_names = []
var state_objects = {}
var current_state: String


func update_velocity(input_vector):
	state_objects[current_state].update_velocity(input_vector)



func change_state(new_state):
	if (new_state != current_state && new_state in state_names):
		if (current_state in state_names):
			exit_state(current_state)
		current_state = new_state
		enter_state(new_state)
	

# ---------------------------------------------------------------------------
# private functions:
func _ready():
	current_state = default_state
	state_objects = {}
	state_names = []
	for child in get_children():
		state_names.append(child.name)
		state_objects[child.name] = child
	enter_state(current_state)


func enter_state(new_state):
	state_objects[new_state].enter_state()


func exit_state(old_state):
	state_objects[old_state].exit_state()
