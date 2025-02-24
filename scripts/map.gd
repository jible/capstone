extends Node2D
class_name Map

# Changed this to 2i check here for issues bugs f-f-f-
@export var size: Vector2i = Vector2i.ZERO
var matrix = []
var seed : int = 0
var noise_ref = FastNoiseLite.new()
var threshold = .3
var player_spawn = Vector2i.ZERO
var end = Vector2i.ZERO
var step_points = [
	Vector2i.ZERO,
	Vector2i(0,1)
]

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

func random_walk(layer, value, steps = size.x * size.y / 5):
	'''
	Generate map on provided layer using random walk method.
	'''
	assert(steps <= size.x * size.y, "Too many steps requested")
	var placed_tiles = 0
	# get directions in which to "walk"
	var directions = [
		Vector2(0,1),	# down
		Vector2(0,-1),	# up
		Vector2(-1,0),	# left
		Vector2(1,0), 	# right
	]
	
	var start = Vector2(floor(size.x/2), floor(size.y/2) )
	
	var pos = start
	var count = 0
	while placed_tiles <= steps:
		placed_tiles += walk_over_point(pos, value)
		count+=1
		
		#update seed
		seed(seed + count)
		pos += directions[randi() % 4]
		if pos.x >= size.x - 5 || pos.x < 5 || pos.y >= size.y - 5 || pos.y <= 5:
			pos = start

func walk_over_point(point:Vector2i, value):
	var placed_tiles = 0
	for i in step_points:
		var look = i + point
		var current_tile = get_tile(look)
		
		if (current_tile.type != value):
			current_tile.type = value
			placed_tiles += 1
	return placed_tiles

func set_spawn_and_exit( min_distance = 15 ):
	var a = Vector2i.ZERO
	var b = Vector2i.ZERO
	
	while (true):
		# Select 2 random points. Both must be on floor tiles
		# If those 2 are within the right distance from eachother, set them and return
		a = get_random_floor()
		b = get_random_floor()
		
		var distance = calc_distance( a, b )
		if (distance > min_distance):
			player_spawn = a
			end = b
			return


func get_random_floor():
	while true:
		var point = Vector2(randi() % (size.x -1), randi() % (size.y- 1))
		# The second half should be a temp fix - 
		# it prevents it from placing tiles on tile sthat will be overwritten with collision
		
		if ( get_tile(point).type == "floor" && get_tile (point - Vector2(0,-1)).type == "floor" ):
			return point

func calc_distance(a,b):
	var distance_v = a - b
	return abs(distance_v.x) + abs(distance_v.y)


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
