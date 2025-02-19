extends SMState

# Exports
@export var lock_direction = true
@export var movement_details =  {}
@export var animation_name = "death"
var callbacks = {
	"end": Callable(self,"anim_end")
}
var direction_dependent = false

signal died

func anim_end():
	emit_signal("died")
	pass

# On readys
@onready var sm = get_parent()

func callback():
	pass
	
# Main Functions
func update_state(delta):
	pass
func enter_state():
	pass
func exit_state():
	pass
