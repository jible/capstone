extends Node2D
class_name LevelGenerator

@export var size : Vector2i = Vector2i(150,150) 
@export var world_seed : int = 0
@export var randomize_seed = false
@export var enter: PackedScene
@export var exit: PackedScene
var tile_size: Vector2
var spawn_point = Vector2.ZERO
var end_point = Vector2.ZERO
var layers = {}
var map: Map

var gen_methods = {
	"limbo": Callable(self, "make_limbo"),
	"lust": Callable(self, "make_lust"),
}

func _ready():
	if randomize_seed:
		world_seed = randi()
	layers = {
		"environment":$Environment,
		"walls": $Walls,
	}
	tile_size = layers["environment"].tile_set.tile_size
	
# For other nodes to find tiles from map
func get_tile_type(pos):
	return map.get_tile(pos).type

func generate_level(level_type):
	'''
	Generate tilemap level dependent on argument type.
	'''
	
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
	
	map.random_walk("terrain", "floor")
	
	# [ ] call function to find tile for player spawn and exit.

func make_lust():
	'''
	Make randomly generated noise to fill the terrai level with floors.
	'''
	
	map.make_noise("terrain", "floor")
	
	# [ ] call function to find tile for player spawn and exit.

func render():
	render_layer("environment")
	
	# Add the enter and exit
	var enter_instance = enter.instantiate()
	get_tree().current_scene.call_deferred("add_child",enter_instance)
	enter_instance.position = spawn_point
	
	var exit_instance = exit.instantiate()
	get_tree().current_scene.call_deferred("add_child",exit_instance)
	exit_instance.position = end_point
	
	# [ ] render walls (aesthetic only, walls are on seperate non-interactable layer).

func render_layer(layer):
	'''
	Render the provided layer.
	'''
	
	for y in range (size.y):
		for x in range(size.x):
			var pos = Vector2(x,y)
			var check_wall = Vector2(x,y + 1 )
			if map.get_tile(pos).type == "floor":
				# get random tile position
				# [ ] get length and width of tileset, rather than magic number
				layers["environment"].set_cell(pos, 0, Vector2i(randi()%10, randi()%10))
			
			if map.get_tile(pos).type == null:
				layers["environment"].set_cell(pos, 0, Vector2i(9, 9))
			
			if map.get_tile(pos).type == null && check_wall.y < map.size.y && map.get_tile(check_wall).type == "floor":
				layers["walls"].set_cell(pos, 0, Vector2i(0,0))
				layers["walls"].set_cell(Vector2(x,y - 1 ), 0, Vector2i(1,0))
