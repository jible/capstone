extends Node

@export var level_generator: Node2D
@onready var player: Player = get_tree().get_first_node_in_group("Player")
var max_living_enemies = 10
var min_dist_from_player = 100
var time_since_check = 0
var spawn_time = .2

var enemy_info = {
	 "basic_enemy": {
		"path" : "res://scenes/prefabs/npcs/enemies/basic_enemy.tscn",
		"amount": 50
	},
}


var enemy_pools: Dictionary = {}

func _ready():
	for key in enemy_info:
		var value = enemy_info [key]
		enemy_pools[key] =  Pool.new( value.path, value.amount)

func enemy_killed(enemy):
	if enemy.reset:
		enemy.reset()
	enemy_pools[enemy.type] = enemy_pools.get( enemy.tpye, 0) + 1
	

func spawn_enemy(pos, enemy_type = null):
	if enemy_type == null || enemy_pools[enemy_type].size() <= 0:
		return null
	var new_enemy = enemy_pools[enemy_type].pop_back()
	new_enemy.global_position = pos
	# might need to reset its velocity after TPing it
	get_tree().current_scene.add_child(new_enemy)
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
