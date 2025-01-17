extends Sprite2D

# Exports
## Index 0 is width, Index 1 is height
@export var frame_size : Vector2i = Vector2i(32,32)
@export var sm :StateMachine


#Properties
var time_per_frame: float 
var current_frame_index : int = 0
var frame_progress : float = 0.0
var buffered_direction = null
var current_direction = 3
var frame_rate: float = 1.0
var current_animation 

# On Readys
@export var default_animation = {
	"framerate" : 1.0,
	"frames" : [0],
	"callbacks" : Dictionary(),
}


func _process(delta):
	frame_progress +=delta
	if (frame_progress > time_per_frame):
		frame_progress -= time_per_frame
		_advance_frame()


func _set_animation(animation: Dictionary):
	""" 
	Sets argument animation as current animation and updates sprite and framerate appropriately
	"""
	assert (animation.has("frames"), "No frames set on new animation:")
	current_animation = _create_animation(animation)
	frame_rate = current_animation["framerate"]
	time_per_frame = 1.0/frame_rate
	frame_progress = 0.0
	current_frame_index = 0
	_update_sprite()
	
	
func _advance_frame():
	"""
	Progesses the frame count and updates the sprite appropriately. calls the callback for the respective frame
	and calls the callback for completeing the last frame 
	"""
	current_frame_index += 1
	if current_frame_index >= current_animation["frames"].size():
		var animation_callback = current_animation["callbacks"].get("end", null)
		if animation_callback:
			animation_callback.call()
		current_frame_index = 0
	
	var new_frame = current_animation["frames"][current_frame_index]
	var frame_callback = current_animation["callbacks"].get(current_frame_index, null)
	if frame_callback:
		frame_callback.call()
		
	_update_sprite()


func _update_sprite():
	"""
	Assumes background info has been updated
	Updates the player's sprite to match the current animation and frame index
	"""
	var frame_num: int = current_animation["frames"][current_frame_index]
	region_rect = Rect2( frame_num * frame_size.x, current_direction * frame_size.y, frame_size.x, frame_size.y)


func _on_state_machine_state_changed(new_state):
	""" When the state machine changes states, it fires this signal. it results in reseting the animation
	and updating to a new animation
	"""
	if buffered_direction:
		current_direction = buffered_direction
		buffered_direction = null
	
	var animation = new_state.animation
	if animation:
		_set_animation(animation)


func _on_direction_manager_direction_changed( direction):
	"""
	Updates sprite if direction changes.
	Buffers direction change if current state locks direction
	Direction buffer may need to move to another object. 
	"""
	
	var new_direction = _direction_to_column(direction)
	if sm.get_current_state_node().lock_direction:
		buffered_direction = new_direction
	else: 
		_change_direction(new_direction)


func _change_direction(direction):
	current_direction = direction
	_update_sprite()


func _create_animation(base_animation: Dictionary):
	""" 
	This takes the argument animation and makes a new animation, who has the same values, but default values are filled in
	"""
	var new_animation = {
		"framerate" : base_animation.get("framerate", default_animation["framerate"]),
		"frames" : base_animation["frames"],
		"callbacks" : base_animation.get("callbacks", default_animation["callbacks"])
	}
	return new_animation


func _direction_to_column(direction):
	"""
	Converts direction string to coresponding column index
	"""
	
	var direction_dict = {
		"south": 0,
		"north": 3,
		"east": 2,
		"west": 1,
	}
	return direction_dict.get(direction , 3) # defaults to north
