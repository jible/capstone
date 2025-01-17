extends Node

@export var player: CharacterBody2D
var look_vector: Vector2

@onready var direction_visualizer: Line2D = $Line2D
var visualizer_length = 100

@export var sm: StateMachine

signal direction_changed


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

	update_visualizer()

func update_visualizer():
	var start = player.position
	var end = start + look_vector * visualizer_length
	direction_visualizer.points = [start, end]


func dir_to_str(dir: Vector2):
	var dir_dict = {
		Vector2.UP: "north",
		Vector2.DOWN: "south",
		Vector2.RIGHT: "east",
		Vector2.LEFT: "west",
	}
	return dir_dict.get(dir, "unknown")
