extends Node2D
class_name Map


@export var size: Vector2 = Vector2.ZERO

@export var name_to_id = {
	"floor": 0
}
@export var name_to_pos = {
	"floor" : Vector2(0,0)
}
var matrix = []
var seed : int = 0

func _init(arg_size, arg_seed):
	size = arg_size
	seed = arg_seed
	configure_matrix()


func configure_matrix():
	for y in range (size.y):
		matrix.append([])
		for x in range(size.x):
			matrix[y].append( Tile.new() )


func get_tile(pos):
	return matrix[pos.y][pos.x]

func fill(value, layer):
	for y in range (size.y):
		for x in range(size.x):
			matrix[y][x][layer] = value
			

func randomWalk(layer, value, steps = (size.x * size.y)/2):
	var directions = [
		Vector2(0,1),
		Vector2(0,-1),
		Vector2(-1,0),
		Vector2(1,0), 
	]
	
	
	var start = Vector2(floor(size.x/2), floor(size.y/2) )
	var pos = start
	for step in range(steps):
		var current_tile = get_tile(pos)
		current_tile.layers[layer] = 1
		#update seed
		seed(seed + step)
		pos += directions[randi() % 4]
		if pos.x >= size.x || pos.x < 0 || pos.y >= size.y || pos.y < 0:
			pos = start
			
func fill_opposite(look_layer, fill_layer):
	for y in range (size.y):
		for x in range(size.x):
			var pos = Vector2(x,y)
			var look = get_tile(pos)
			if look[look_layer] > 0:
				look[fill_layer] = 0
			else:
				look[fill_layer] = 1
