extends Node2D
class_name LevelGenerator

@export var size : Vector2i = Vector2i(150,150) 
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

var gen_methods = {
	"limbo": Callable(self, "make_limbo"),
	"lust": Callable(self, "make_lust"),
}


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
	if randomize_seed:
		world_seed = randi()
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

func generate_level(level_type):
	'''
	Generate tilemap level dependent on argument type.
	'''
	prep()
	map = Map.new(size, world_seed)
	gen_methods[level_type].call()
	
	var tile_size = Vector2( layers["environment"].tile_set.tile_size )
	spawn_point = ( map.player_spawn * tile_size ) + (.5 * tile_size)
	end_point = ( map.end * tile_size ) + (.5 * tile_size)
	render()

func make_limbo():
	'''
	Randomly walk the terrain level and fill it with floors.
	'''
	
	map.random_walk("terrain", "floor", 1000)
	map.set_spawn_and_exit()
	
	# [ ] call function to find tile for player spawn and exit.

func make_lust():
	'''
	Make randomly generated noise to fill the terrai level with floors.
	'''
	map.make_noise("terrain", "floor")
	
	# [ ] call function to find tile for player spawn and exit.

func render():
	render_tiles("environment")
	
	# Add the enter and exit
	var enter_instance = enter.instantiate()
	get_tree().current_scene.call_deferred("add_child",enter_instance)
	enter_instance.position = spawn_point
	
	var exit_instance = exit.instantiate()
	get_tree().current_scene.call_deferred("add_child",exit_instance)
	exit_instance.position = end_point
	
	nav_mesh_maker.make_mesh(get_corners())


func render_tiles(layer):
	'''
	Render the tile map by placing tiles on the appropriate layers.
	'''
	
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
				layers["wall1"].set_cell(Vector2(x,y), 0, Vector2i(0,0))
				if y - 1 >= 0:
					layers["wall2"].set_cell(Vector2(x,y - 1), 0, Vector2i(1,0))
				if y -2 >= 0:
					layers["ceiling"].set_cell(Vector2(x,y - 2), 0, Vector2i(2,0))
