extends Node

@export var level_generator: Node2D
const enemy_types: Array[PackedScene] = [
	preload("res://scenes/prefabs/npcs/enemies/basic_enemy.tscn"),
]
@onready var player: Player = get_tree().get_first_node_in_group("Player")
var alive_enemies = 0
var killed_enemies = 0

var max_living_enemies = 10

var min_dist_from_player = 100

var time_since_check = 0
var spawn_time = .2

func enemy_killed(enemy):
	alive_enemies -= 1
	killed_enemies += 1
	pass

func spawn_enemy(pos, enemy = null):
	if enemy == null:
		enemy = randi()% enemy_types.size()
	var instance = enemy_types[enemy].instantiate()
	get_tree().current_scene.add_child(instance)
	instance.position = pos
	alive_enemies += 1
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	'''
	Every second, pick a random tile.
	if that tile is a floor tile, get its position
	if that position is beyond a certain distance from the player,
	spawn an enemy there.
	Add to current enemy count
	'''
	
	time_since_check += delta
	if time_since_check > spawn_time:
		time_since_check = 0
		if max_living_enemies < alive_enemies:
			return
		var success = try_spawn()
	pass

func try_spawn():
	# Get a random tile.
	# check if its spawnable
	var map_size = level_generator.size
	var tile_size = level_generator.tile_size
	var tile = Vector2( randi()% map_size.x, randi() % map_size.y)
	if level_generator.get_tile_type(tile) == "floor":
		var true_pos = Vector2(tile_size * tile)
		if (player.position - true_pos).length() > min_dist_from_player:
			spawn_enemy(true_pos)
