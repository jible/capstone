extends Node
class_name Map


@export var size: Vector2 = Vector2.ZERO
var matrix = []
var seed : int = 0


func _ready():
	configure_matrix()


func configure_matrix():
	for y in range (size.y):
		matrix[y] = []
		for x in range(size.x):
			matrix[y][x] = Tile.new()


func get_tile(pos):
	return matrix[pos.y][pos.x]

func fill(value, layer):
	for y in range (size.y):
		for x in range(size.x):
			matrix[y][x][layer] = value
			

func randomWalk(steps = (size.x * size.y)/2):
	var directions = [
		Vector2(0,1),
		Vector2(0,-1),
		Vector2(-1,0),
		Vector2(1,0), 
	]
	fill(1, "perimeter_walls")
	
	var start = Vector2(size.x/2, size.y/2)
	var pos = start
	for step in range(steps):
		var current_tile = get_tile(pos)
		current_tile.floor = 1
		current_tile.perimeter_walls = 0
		#update seed
		seed(seed + step)
		pos += directions[randi() % 4]
		if pos.x >= size.x || pos.x < 0 || pos.y >= size.y || pos.y < 0:
			pos = start
