extends SMState

# Exports
@export var character: CharacterBody2D
@export var lock_direction = false
@export var movement_details =  {
	"max_speed_mult" : 5
}
@export var animation_name = "idle"

# On readys
@onready var sm = get_parent()
var vel_impulse = 400
var direction_dependent = true
var callbacks = {}
var is_active = false


# Main Functions
func update_state(delta):
	pass
func enter_state():
	character.mobility_manager.apply_impulse( (character.navigator.get_next_step() - character.position).normalized() * vel_impulse)
	
	pass
func exit_state():
	pass
