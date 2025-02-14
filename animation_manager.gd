extends AnimatedSprite2D
class_name AnimationManager
#Properties
var current_direction = "north"
var current_state = null
var callbacks = {}

func update_anim():
	""" 
	Plays animation based on animation name and direction properties
	"""
	var true_animation_name
	if current_state.direction_dependent:
		true_animation_name = current_state.animation_name + "_" + current_direction
	else:
		true_animation_name = current_state.animation_name
		
	play(true_animation_name)


func _on_state_machine_state_changed(new_state):
	""" 
	When the state machine changes states, it fires this signal. 
	This sets the animation name and calls a new animation. it also updates the callbacks collection.
	"""
	current_state = new_state
	callbacks = new_state.callbacks
	update_anim()

func _on_direction_manager_direction_changed( direction):
	"""
	Updates sprite if direction changes.
	Buffers direction change if current state locks direction
	Direction buffer may need to move to another object. 
	"""
	
	current_direction = _direction_vec_to_string(direction)
	update_anim()


func _direction_vec_to_string(direction):
	"""
	Converts direction vector to string
	"""

	var direction_dict = {
		Vector2(0,1): "south",
		Vector2(0,-1): "north",
		Vector2(1,0): "east",
		Vector2(-1,0): "west",
	}
	return direction_dict.get(direction , "south") # defaults to north


	
func do_frame_callback(frm):
	var callback
	if callbacks: callback = callbacks.get(frm, null)
	if callback:
		if typeof(callback) == TYPE_ARRAY:
			for i in callback:
				i.call()
		else:
			callback.call()




func _on_frame_changed():
	if frame == 0: return
	do_frame_callback(frame)
	pass # Replace with function body.


func _on_animation_finished():
	var callback
	if callbacks: callback = callbacks.get("end", null)
	if callback:
		if typeof(callback) == TYPE_ARRAY:
			for i in callback:
				i.call()
		else:
			callback.call()


func _on_animation_changed():
	do_frame_callback(0)
	pass # Replace with function body.
