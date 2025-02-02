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
		"terrain": $Environment,
		"objects": $Objects,
	}
	generate_level("limbo")


func generate_level(level_type):
	map = Map.new(size, world_seed)
	gen_methods[level_type].call()
	render()
	
	
func make_limbo():
	# Randomly walk the terrain level and fill it with floors. 
	
	map.randomWalk("terrain","floor")


func render():
	render_layer("terrain")

func render_layer(layer):
	for y in range (size.y):
		for x in range(size.x):
			var pos = Vector2(x,y)
			if map.get_tile(pos).layers[layer] != null:
				layers[layer].set_cell(pos, 0, Vector2i(1, 1))
