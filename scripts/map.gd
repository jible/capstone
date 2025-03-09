extends Node2D
class_name Map


@export var size: Vector2i = Vector2i.ZERO
var matrix = []
var seed : int = 0
var noise_ref = FastNoiseLite.new()
var threshold = .3
var player_spawn = Vector2i.ZERO
var end = Vector2i.ZERO
var step_points = [
	Vector2i.ZERO
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



func random_walk( value, steps = size.x * size.y / 5):
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
		if ( get_tile(point).type == "floor"):
			return point

func calc_distance(a,b):
	var distance_v = a - b
	return abs(distance_v.x) + abs(distance_v.y)


func make_noise(value):
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


func place_next_floor_hint(density = 20):
	'''
	Randomly changes tiles to "next" level. Tiles closer to the exit are 
	Density is a multiplier to increase the density at which the next level tiles are placed. 
	At 0, there are no "next" tiles
	
	'''
	var count = 0
	for y in range (size.y):
		for x in range(size.x):
			var pos = Vector2(x,y)
			var tile = get_tile(pos)
			var dist_from_end = int(Vector2( end - pos ).length())
			# Using this algorithm because the distance doesn't need to be exact and this is less expensive
			if dist_from_end == 0:
				tile.level = "next"
			elif tile.type == "floor":
				var chance = randi_range(0,floor ( (dist_from_end ** 2)/ density) )
				if chance == 0:
					tile.level = "next"

func decide_all_walls():
	for y in range (size.y):
		for x in range(size.x):
			var pos = Vector2(x,y)
			decide_tile_walls(pos)


func decide_tile_walls(pos):
	'''
	Decides what walls are placed to a given tile
	'''
	
	var directions = {
		"north" : {"north": true},
		"west": {"west": true},
		"east":{"east": true},
		"south": {"south": true},
		"nw": {"north": false, "nw": true, "west": false},
		"sw": {"south": false, "sw": true, "west": false},
		"ne": {"north": false, "ne": true, "east": false},
		"se": {"south": false, "se": true, "east": false}
	}
	var dir_to_off_vector = {
		"north" :Vector2i(0,-1),
		"west":Vector2i(-1,0),
		"east":Vector2i(1,0),
		"south":Vector2i(0,1),
		"nw":Vector2i(-1,-1),
		"sw":Vector2i(-1,1),
		"ne":Vector2i(1,-1),
		"se":Vector2i(1,1)
	}
	var tile = get_tile(pos)
	for direction in directions.keys():
		var place_wall = true
		for requirement in directions[direction].keys():
			var peek_pos = dir_to_off_vector[requirement] + Vector2i(pos)
			var is_floor = check_in_range(peek_pos) && get_tile(peek_pos).type == "floor"
			if is_floor != directions[direction][requirement]:
				place_wall = false
				break
		
		if place_wall: 
			tile.walls.append(direction)


func check_in_range(pos):
	return ! (pos.x < 0 || pos.y < 0 || pos.x >= size.x -1 || pos.y >= size.y -1)
