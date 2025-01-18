extends SMState

# Exports
@export var lock_direction = false
@export var animation_name: String
@export var animation = {
	# Collection of frames. The column number of the frame is all it needs. 
	# You can also pass a callable. This callable will be player when this frame starts
	"framerate" : 4,
	"frames": 
		# Each frame can just be a frame number, or an array with a framenumber 
		[
			[ 
				0, 
				Callable(self, "frameOneFunc")
			], 
			1,
		],
	"callback": Callable(self, "callback")
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
