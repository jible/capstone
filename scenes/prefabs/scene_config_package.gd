extends Node2D

@export var level_generator: Node2D
@export var camera: Camera2D
@export var player: Player
@export var hud: Control
# Called when the node enters the scene tree for the first time.
func _ready():
	'''
	Generate the map
	place the tiles
	put player at spawn point
	'''
	
	level_generator.generate_level(LevelManager.get_current_package())
	config_mini_map()
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

func _process(_delta):
	hud.mini_map_camera.position =  player.position

#https://www.youtube.com/watch?v=CAaJxWUUFqQ&ab_channel=16BitDev
#https://chatgpt.com/share/67cd3f8f-53a4-8012-a72f-04df4b161be2
func config_mini_map():
	# Tune this to adjust the mini-map's zoom
	var zoom_multiplier = 3.0
	hud.mini_map_viewport.world_2d = get_viewport().world_2d
	var mini_map_range = level_generator.get_size()
	var viewport_size = hud.mini_map_viewport.size
	var mini_map_zoom = Vector2(viewport_size.x/ mini_map_range.x, viewport_size.y/ mini_map_range.y) * zoom_multiplier
	hud.mini_map_camera.zoom = mini_map_zoom
