extends Node2D
class_name LevelGenerator

var size : Vector2i = Vector2i(150,150) 
@export var world_seed : int = 0
@export var randomize_seed = false
@export var enter: PackedScene
@export var exit: PackedScene
@export var nav_mesh_maker: NavMeshMaker
var tile_size: Vector2
var spawn_point = Vector2.ZERO
var end_point = Vector2.ZERO
var layers = {}
var map: Map
var enter_instance
var exit_instance
var package

func get_corners():
	# Used the extra distance to debug 
	var extra_distance = Vector2(0,0)
	var top_left = Vector2(-extra_distance.x,-extra_distance.y)
	var top_right = Vector2((tile_size.x * size.x)+ extra_distance.x, -extra_distance.y)
	var bot_right = Vector2((tile_size.x * size.x)+ extra_distance.x, (tile_size.y * size.y) + extra_distance.y)
	var bot_left = Vector2(-1000,(tile_size.y * size.y) + extra_distance.y)
	return PackedVector2Array([
		top_left, 
		top_right,
		bot_right,
		bot_left
	])


func prep():
	# TODO may need to improve seed setting. Right now, this prevents lust 1-3 from being the same.
	if randomize_seed:
		world_seed = randi() + ( 100 * LevelManager.current_level_index)
	layers = {
		"environment":$Environment,
		"wall1": $"Wall Level 1",
		"wall2": $"Wall Level 2",
		"ceiling": $"Ceiling",
	}
	tile_size = layers["environment"].tile_set.tile_size

# For other nodes to find tiles from map
func get_tile_type(pos):
	return map.get_tile(pos).type

func generate_level(level_package):
	'''
	Generate tilemap level dependent on argument type.
	'''
	package = level_package
	prep()
	size.x = package.width
	size.y = package.height
	map = Map.new(size, world_seed)
	
	# TODO - fill this out as more methods are made.
	# We may want to use noise or wave collapse function or a modified walk
	match package.gen_method:
		"walk":
			map.random_walk("terrain", "floor", package.floor_tiles)
		"_":
			map.random_walk("terrain", "floor", package.floor_tiles)
	
	map.set_spawn_and_exit()
	
	var tile_size = Vector2( layers["environment"].tile_set.tile_size )
	spawn_point = ( map.player_spawn * tile_size ) + (.5 * tile_size)
	end_point = ( map.end * tile_size ) + (.5 * tile_size)
	render()
	
	# Re randomize world seed after making seeded content.
	randomize()


func render():
	render_tiles("environment")
	
	# Add the enter and exit
	enter_instance = enter.instantiate()
	get_tree().current_scene.call_deferred("add_child",enter_instance)
	enter_instance.position = spawn_point
	
	exit_instance = exit.instantiate()
	get_tree().current_scene.call_deferred("add_child",exit_instance)
	exit_instance.position = end_point
	
	LevelManager.link_exit(exit_instance)
	
	nav_mesh_maker.make_mesh(get_corners())


func render_tiles(layer):
	'''
	Render the tile map by placing tiles on the appropriate layers.
	'''
	
	var modified_walls = []
	for y in range (size.y):
		for x in range(size.x):
			var pos = Vector2(x,y)
			var check_wall = Vector2(x,y + 1 )
			if map.get_tile(pos).type == "floor":
				# get random tile position
				# [ ] get length and width of tileset, rather than magic number
				layers["environment"].set_cell(pos, 0, Vector2i(randi()%9, randi()%9))
			if map.get_tile(pos).type == null:
				layers["environment"].set_cell(pos, 0, Vector2i(9, 9))
			
			if map.get_tile(pos).type == null:
				modified_walls.append( Vector2i( pos ) ) 
				
	layers["wall1"].set_cells_terrain_connect(modified_walls, 0 ,0 )
