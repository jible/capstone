extends Node


# Exports 
@export var player: CharacterBody2D
@export var sm: StateMachine

# Properties
var look_vector: Vector2
var visualizer_length = 100

# Signals
signal direction_changed

# Main Functions
func _physics_process(delta):
	update_direction()

func update_direction():
	var new_look_vector = InputManager.get_look_vector(player.position)
	
	# Rounds the "look vector" to the x or y axis, so it matches the player sprites
	if (abs(new_look_vector.x) > abs(new_look_vector.y)):
		new_look_vector = Vector2(new_look_vector.x,0).normalized()
	elif (abs(new_look_vector.x) < abs(new_look_vector.y)): 
		new_look_vector = Vector2(0,new_look_vector.y).normalized()
	
	if look_vector != new_look_vector:
		look_vector = new_look_vector
		emit_signal("direction_changed", dir_to_str(look_vector))



# helper functions
func dir_to_str(dir: Vector2):
	var dir_dict = {
		Vector2.UP: "north",
		Vector2.DOWN: "south",
		Vector2.RIGHT: "east",
		Vector2.LEFT: "west",
	}
	return dir_dict.get(dir, "north")



# Attatch a line 2d to this to use a visualizer 
#@onready var direction_visualizer: Line2D = $Line2D
#func update_visualizer():
	#var start = player.position
	#var end = start + look_vector * visualizer_length
	#direction_visualizer.points = [start, end]
