extends SMState

# Exports
@export var player:CharacterBody2D
@export var max_speed: int= -1
@export var acceleration: int = -1
@export var lock_direction = false

# On Readys
@onready var sm = get_parent()

# Main Functions 
func update_state(delta):
	if player.velocity.length() > 5:
		sm.change_state("Walk")
	pass
func enter_state():
	pass
func exit_state():
	pass
