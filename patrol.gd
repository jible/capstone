extends SMState

# Exports
@export var character:CharacterBody2D
@export var lock_direction = false
@export var movement_details =  {}
@export var animation_name = "ParticleProcessMaterial"

# Other variables
@onready var sm = get_parent()
var callbacks = {}
var direction_dependent = false
var is_active = false

# Main Functions 
func update_state(delta):
	
	pass
func enter_state():
	pass
func exit_state():
	pass
