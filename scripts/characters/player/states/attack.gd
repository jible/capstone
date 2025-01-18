extends SMState

# Exports
@export var max_speed: int
@export var acceleration: int
@export var lock_direction = false
@export var animation_name: String = "attack"

# Onreadys
@onready var sm = get_parent()


# Main Functions
func update_state(delta):
	pass
func enter_state():
	pass
func exit_state():
	pass
