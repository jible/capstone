extends Node2D
class_name LevelGenerator

@export var size : Vector2i = Vector2i(100,100)
@export var world_seed : int = 0
var map: Map

var gen_methods = {
	"limbo": Callable(self, "make_limbo"),
	"lust": Callable(self, "make_lust"),
}
var layers 

func _ready():
	layers = {
		"environment": $Environment,
		"walls": $Walls,
	}
	generate_level("lust")

func generate_level(level_type):
	'''
	Generate tilemap level dependent on argument type.
	'''
	map = Map.new(size, world_seed)
	gen_methods[level_type].call()
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
				layers["environment"].set_cell(pos, 0, Vector2i(randi()%28, randi()%28))
			if map.get_tile(pos).type == null:
				layers["environment"].set_cell(pos, 0, Vector2i(29, 29))
			if map.get_tile(pos).type == null && check_wall.y < map.size.y && map.get_tile(check_wall).type == "floor":
				layers["walls"].set_cell(pos, 0, Vector2i(1, randi()%3))
				layers["walls"].set_cell(Vector2(x,y - 1 ), 0, Vector2i(0, randi()%3))
