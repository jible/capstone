extends Node2D


@export var level_type = "limbo"
@export var level_generator: Node2D
@export var player: Player
# Called when the node enters the scene tree for the first time.
func _ready():
	'''
	Generate the map
	place the tiles
	
	put player at spawn point
	
	'''
	
	level_generator.generate_level(level_type)
	place_player()
	
	pass # Replace with function body.


func place_player():
	player.global_position = level_generator.spawn_point
