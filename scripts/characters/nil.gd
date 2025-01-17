extends SMState

# Exports
@export var lock_direction = false
@export var animation_name: String

# On readys
@onready var sm = get_parent()


# Main Functions
func update_state(delta):
	print("I run every frame when this is the current frame")
	pass
func enter_state():
	pass
func exit_state():
	print(" I run once when this is the current state and change state is called")
	pass
