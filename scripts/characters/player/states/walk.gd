extends SMState

# Exports
@export var player:CharacterBody2D
@export var lock_direction = false
@export var movement_details =  {}
@export var animation_name = "walk"

# Other variables
@onready var sm = get_parent()
var direction_dependent = true
var callbacks = {}
var is_active = false

# Main Functions
func update_state(delta):
	if player.velocity.length() < 5:
		sm.change_state("Idle")
	elif Input.is_action_just_pressed("attack"):
		sm.change_state("Attack")
	elif Input.is_action_just_pressed("dash"):
		sm.change_state("Dash")
	pass
func enter_state():
	pass
func exit_state():
	pass
