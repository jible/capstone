extends Node

@export var player: CharacterBody2D
var look_vector: Vector2

@onready var direction_visualizer: Line2D = $Line2D
var visualizer_length = 100


func _physics_process(delta):
	update_direction()

func update_direction():
	# Starts by finding the angle between the player and the mouse- this should be easy to implement with 
	var new_look_vector = InputManager.get_look_vector(player.position)
	
	# Rounds the "look vector" to the x or y axis, so it matches the player sprites
	if (abs(new_look_vector.x) > abs(new_look_vector.y)):
		new_look_vector = Vector2(new_look_vector.x,0).normalized()
	elif (abs(new_look_vector.x) < abs(new_look_vector.y)): 
		new_look_vector = Vector2(0,new_look_vector.y).normalized()
	
	if look_vector != new_look_vector:
		look_vector = new_look_vector
		#print("The player needs to turn!")

	update_visualizer()

func update_visualizer():
	var start = player.position
	var end = start + look_vector * visualizer_length
	direction_visualizer.points = [start, end]
