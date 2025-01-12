extends Node

@export var player: CharacterBody2D
var player_direction_vector: Vector2
var possible_directions: int = 4

@onready var direction_visualizer: Line2D = $Line2D
var visualizer_length = 100


func _physics_process(delta):
	update_direction()
	update_visualizer()

func update_direction():
	# not sure how expensive it is to get viewport ( not sure if i call this everytime or store the viewport ) 
	var mouse_position = get_viewport().get_mouse_position()
	var player_position = player.position
	player_direction_vector = (mouse_position - player_position).normalized()
		

func update_visualizer():
	var start = player.position
	var end = start + player_direction_vector * visualizer_length
	direction_visualizer.points = [start, end]
