extends Node


# Exports
@export var lock_direction = false
@export var player:CharacterBody2D

# On Readys
@onready var sm = get_parent()

# Attributes 
var mobility = "Default"

# Main Functions 
func update_state(delta):
	if !Input.is_action_pressed("run"):
		sm.change_state("Walk")
	elif player.velocity.length() < 5:
		sm.change_state("Idle")
	pass
func enter_state():
	pass
func exit_state():
	pass
