extends Node

@export var level_generator: Node2D

@onready var player: Player = get_tree().get_first_node_in_group("Player")
var min_dist_from_player = 2000
var enemy_package
var max_concurrent_enemies
var required_enemies
var time_since_check = 0
var spawn_time = .2

var name_to_path = {
	 "infinimouth" : "res://scenes/prefabs/npcs/enemies/basic_enemy.tscn",
		
}

var enemy_pools: Dictionary = {}

func _ready():
	enemy_package = LevelManager.get_current_package().enemy_package
	
	# 
	max_concurrent_enemies = enemy_package.max_concurrent_enemies
	required_enemies =enemy_package.required_enemies
	
	var enemy_info = []
	var walk = 0
	
	for enemy in enemy_package.enemy_types:
		enemy_info.append(
			[ "name",]
		)
	
	
	for key in enemy_info:
		var value = enemy_info [key]
		enemy_pools[key] = Pool.new( value.path, value.amount)

func enemy_killed(enemy):
	enemy_pools[enemy.type].kill(enemy)

func spawn_enemy(pos, enemy_type = null):
	if enemy_type == null || enemy_pools[enemy_type].collection.size() <= 30:
		return null
	var new_enemy = enemy_pools[enemy_type].add(get_tree().current_scene)
	new_enemy.global_position = pos
	# might need to reset its velocity after TPing it
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
		time_since_check -= spawn_time
		try_spawn()
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
			spawn_enemy(true_pos, "basic_enemy")
