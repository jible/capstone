extends SMState

# Exports
@export var player:CharacterBody2D
@export var lock_direction = false
@export var movement_details =  {}
@export var animation_name = "idle"

# Other variables
@onready var sm = get_parent()
var callbacks = {}
var direction_dependent = true
var is_active = false

# Main Functions 
func update_state(delta):
	if player.velocity.length() > 5:
		sm.change_state("Walk")
		return
	if Input.is_action_just_pressed("attack"):
		sm.change_state("Attack")
	if Input.is_action_just_pressed("debug_hurt_player"):
		sm.change_state("Hurt")
	pass
func enter_state():
	pass
func exit_state():
	pass
