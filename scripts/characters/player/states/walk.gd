extends SMState

# Exports
@export var max_speed: int
@export var acceleration: int
@export var player:CharacterBody2D
@export var lock_direction = false

# On readys
@onready var sm = get_parent()




# Main Functions
func update_state(delta):
	if Input.is_action_pressed("run"):
		sm.change_state("Run")
	elif player.velocity.length() < 5:
		sm.change_state("Idle")
	pass
func enter_state():
	pass
func exit_state():
	pass
