extends SMState

# Exports
@export var lock_direction = true
@export var movement_details =  {}
@export var animation = {
	"frames": [0,1,0,1],
	"framerate": 4,
	"callbacks" : {
		"end": Callable(self,"anim_end")
	}
}

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
