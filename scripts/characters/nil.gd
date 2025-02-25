extends SMState

# Exports
@export var lock_direction = false
@export var movement_details =  {}
@export var animation_name = "nil"

# Other variables
@onready var sm = get_parent()
var direction_dependent = true
var callbacks = {}
var is_active = false


func frameOneFunc():
	pass

func callback():
	pass
	
	# Main Functions
func update_state(delta):
	pass
func enter_state():
	pass
func exit_state():
	pass
