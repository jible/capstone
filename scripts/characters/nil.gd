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
	print("I run every frame when this is the current frame")
	pass
func enter_state():
	pass
func exit_state():
	print(" I run once when this is the current state and change state is called")
	pass
