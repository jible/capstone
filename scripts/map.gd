extends Node2D
class_name Map

@export var size: Vector2 = Vector2.ZERO
var matrix = []
var seed : int = 0
var noise_ref = FastNoiseLite.new()
var threshold = .3
var player_spawn = Vector2i.ZERO
var end = Vector2i.ZERO

func _init(arg_size, arg_seed):
	size = arg_size
	seed = arg_seed
	noise_ref.seed = seed
	configure_matrix()

func configure_matrix():
	'''
	Fill matrix with tiles.
	'''
	
	for y in range (size.y):
		matrix.append([])
		
		for x in range(size.x):
			matrix[y].append( Tile.new() )

func get_tile(pos):
	return matrix[pos.y][pos.x]

func fill(value, layer):
	'''
	Set all tiles on provided layer to provided value.
	'''
	
	for y in range (size.y):
		for x in range(size.x):
			matrix[y][x][layer] = value

func random_walk(layer, value, steps = (size.x * size.y)/2):
	'''
	Generate map on provided layer using random walk method.
	'''
	
	# get directions in which to "walk"
	var directions = [
		Vector2(0,1),	# down
		Vector2(0,-1),	# up
		Vector2(-1,0),	# left
		Vector2(1,0), 	# right
	]
	
	var start = Vector2(floor(size.x/2), floor(size.y/2) )
	player_spawn = start
	
	var pos = start
	for step in range(steps):
		var current_tile = get_tile(pos)
		current_tile.type = value
		
		#update seed
		seed(seed + step)
		pos += directions[randi() % 4]
		
		if pos.x >= size.x || pos.x < 0 || pos.y >= size.y || pos.y < 0:
			pos = start
	end = pos

func make_noise(layer, value):
	'''
	Generate map on provided layer using noise.
	'''
	
	for y in range (size.y):
		for x in range(size.x):
			# find position and noise value (float)
			var pos = Vector2i(x,y)
			var output = noise_ref.get_noise_2dv(pos)
			
			# if the output is greater than the threshold create 'value' tile
			if output > threshold:
				get_tile(pos).type = value
