extends SMState

# Exports
@export var lock_direction = false
@export var movement_details =  {}
@export var animation = {
	"frames": [0,2],
	"framerate": 4
}

# On readys
@onready var sm = get_parent()

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
