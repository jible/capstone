extends AnimatedSprite2D
class_name AnimationManager
# Exports
## Index 0 is width, Index 1 is height
@export var frame_size : Vector2i = Vector2i(32,32)

#Properties
var current_direction = "north"
var current_state 
var current_package = {}

func _set_animation(animation_name: String):
	""" 
	Sets argument animation as current animation and updates sprite and framerate appropriately
	"""
	var true_animation_name = animation_name + "_" + current_direction
	play(animation_name)
	
	
func do_frame_callbacks():
	var callback = current_package.get(frame, null)
	if callback:
		if typeof(callback) == TYPE_ARRAY:
			for i in callback:
				i.call()
		else:
			callback.call()



func _on_state_machine_state_changed(new_state):
	""" When the state machine changes states, it fires this signal. it results in reseting the animation
	and updating to a new animation
	"""
	
	var animation = new_state.animation
	if animation:
		_set_animation(animation)

func _on_direction_manager_direction_changed( direction):
	"""
	Updates sprite if direction changes.
	Buffers direction change if current state locks direction
	Direction buffer may need to move to another object. 
	"""
	
	var new_direction = _direction_vec_to_string(direction)
	_change_direction(new_direction)

func _change_direction(direction):
	current_direction = direction
	


func _direction_vec_to_string(direction):
	"""
	Converts direction string to coresponding column index
	"""

	var direction_dict = {
		Vector2(0,1): "south",
		Vector2(0,-1): "north",
		Vector2(1,0): "east",
		Vector2(-1,0): "west",
	}
	return direction_dict.get(direction , "north") # defaults to north
