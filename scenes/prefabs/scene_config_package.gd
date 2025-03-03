extends Node2D

@export var level_generator: Node2D
@export var camera: Camera2D
@export var player: Player

# Called when the node enters the scene tree for the first time.
func _ready():
	'''
	Generate the map
	place the tiles
	put player at spawn point
	'''
	
	level_generator.generate_level(LevelManager.get_current_package())
	place_player()
	play_music()

func play_music():
	MusicManager.stop()
	MusicManager.change_song(MusicManager.LUST)
	# TODO Connect music asset for level and play
	
func place_player():
	player.global_position = level_generator.spawn_point
	
	# move the camera to the player
	camera.global_position = player.global_position
