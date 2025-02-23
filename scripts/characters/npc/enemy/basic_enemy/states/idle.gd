extends SMState

# Exports
@export var character: CharacterBody2D
@export var lock_direction = false
@export var movement_details =  {}
@export var animation_name = "idle"

# On readys
@onready var sm = get_parent()
var direction_dependent = true
var callbacks = {}
var is_active = false


# Main Functions
func update_state(delta):
	pass
func enter_state():
	pass
func exit_state():
	pass


func _on_target_tracker_new_target(new_target):
	if new_target:
		sm.change_state("Pursuit")
