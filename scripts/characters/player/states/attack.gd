extends SMState

# Exports
@export var max_speed: int
@export var acceleration: int
@export var lock_direction = false
@export var animation = {
	"framerate" : 5,
	"frames": [5,6,7],
	"callbacks" :{
		1: Callable(self, "bal"),
		"end": Callable(self, "end"),
	}
}
# Onreadys
@onready var sm = get_parent()




func end():
	print("hahiai")
	sm.change_state("Idle")

# Main Functions
func update_state(delta):
	pass
func enter_state():
	pass
func exit_state():
	pass
