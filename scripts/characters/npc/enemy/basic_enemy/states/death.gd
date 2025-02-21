extends SMState

# Exports
@export var lock_direction = true
@export var movement_details =  {}
@export var animation_name = "death"

# Variables
@onready var sm = get_parent()
var direction_dependent = false
var callbacks = {
	"end": Callable(self,"anim_end")
}

# Signals
signal died

# Callback functions
func anim_end():
	emit_signal("died")
	pass

# Main Functions
func update_state(delta):
	pass
func enter_state():
	pass
func exit_state():
	pass
