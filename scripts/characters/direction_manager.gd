extends Node


# Exports 
@export var sm: StateMachine
@export var character: CharacterBody2D
# Properties
var look_vector: Vector2

# Signals
signal direction_changed

# Main Functions
func _physics_process(_delta):
	if !sm.current_state_node.lock_direction:
		update_direction()

func _on_state_machine_state_changed(_state):
	update_direction()
	pass # Replace with function body.



func update_direction():
	var new_look_vector = character.get_direction()
	if (abs(new_look_vector.x) > abs(new_look_vector.y)):
		new_look_vector = Vector2(new_look_vector.x,0).normalized()
	elif (abs(new_look_vector.x) < abs(new_look_vector.y)): 
		new_look_vector = Vector2(0,new_look_vector.y).normalized()
	
	if look_vector != new_look_vector:
		look_vector = new_look_vector
		emit_signal("direction_changed", look_vector)



# helper functions
func dir_to_str(dir: Vector2):
	var dir_dict = {
		Vector2.UP: "north",
		Vector2.DOWN: "south",
		Vector2.RIGHT: "east",
		Vector2.LEFT: "west",
	}
	return dir_dict.get(dir, "north")



	#var end = start + look_vector * visualizer_length
	#direction_visualizer.points = [start, end]
