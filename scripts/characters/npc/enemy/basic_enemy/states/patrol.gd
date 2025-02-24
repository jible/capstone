extends SMState

# Exports
@export var character: CharacterBody2D
@export var lock_direction = false
@export var movement_details =  {}
@export var animation_name = "idle"
@export var min_patrol_distance: int = 1000
@export var max_patrol_distance: int = 5000
# On readys
@onready var sm = get_parent()
var direction_dependent = true
var callbacks = {}
var is_active = false
var walking = false
var current_destination = null
var required_distance_from_target = 10

# Main Functions
func update_state(delta):
	if (!walking):
		current_destination = get_new_destination()
		character.navigator.update_target_pos(current_destination)
	if (character.position - current_destination).length() < required_distance_from_target:
		current_destination = null
		walking = false
		return
	
	var target_vector =  character.navigator.get_next_step() - character.global_position
	target_vector = target_vector.normalized()
	character.mobility_manager.input_direction = target_vector
func enter_state():
	character.navigator.turn_off()
	# TODO - remove this randomize call!! It should be called in the level generator to set the randomness back to true random after 
	# spawning in the seeded world. I'm not addign to that to prevent conflicts right now.
	pass
func exit_state():
	pass


func get_new_destination():
	var x = randf_range ( min_patrol_distance , max_patrol_distance ) * (1 if (randi() % 2 == 0) else -1)
	var y = randf_range ( min_patrol_distance , max_patrol_distance ) * (1 if (randi() % 2 == 0) else -1)
	return Vector2(x,y) + character.global_position


func _on_target_tracker_new_target(new_target):
	if new_target:
		sm.change_state("Pursuit")
