extends Node

@export var level_generator: Node2D
@export var item_manager: ItemManager

@onready var player: Player = get_tree().get_first_node_in_group("Player")
var min_dist_from_player = 2000
var enemy_package
var max_concurrent_enemies
var required_enemies
var live_enemies = 0
var enemies_killed = 0
var time_since_check = 0
var enemies_spawned =0
var spawn_time = .2
var enemy_odds = []
var enemy_pools: Dictionary = {}
var name_to_path = {
	 "infinimouth" : "res://scenes/prefabs/npcs/enemies/infinimouth.tscn",
}

func _ready():
	enemy_package = LevelManager.get_current_package().enemy_package
	
	max_concurrent_enemies = enemy_package.max_concurrent_enemies
	required_enemies = enemy_package.required_enemies
	
	var accumulated_odds = 0
	
	for enemy in enemy_package.enemy_types:
		accumulated_odds+= enemy.frequency
		enemy_odds.append( { "name": enemy.name, "odds": accumulated_odds}  )
	for enemy in enemy_package.enemy_types:
		enemy_pools[enemy.name] = Pool.new( name_to_path[enemy.name] , enemy.pool_size )

func enemy_killed(enemy):
	live_enemies -= 1
	enemies_killed += 1
	
	#TODO temp code to make drop a 50/50
	
	var chance =randi()
	var drop_name
	if chance%2 == 0:
		drop_name = "health"
	else:
		drop_name = "currency"
	item_manager.spawn_item(drop_name, enemy.position)
	death_drop()
	SignalBus.enemy_killed.emit(enemies_killed)
	ScoreManager.increase_score(1)
	if enemies_killed >= required_enemies:
		print("required_enemies_killed")
		SignalBus.required_enemies_killed.emit()
		
	enemy_pools[enemy.type].kill(enemy)


func death_drop():
	
	pass


func spawn_enemy(pos, enemy_type = null):
	if enemy_type == null || ! ( enemy_pools[enemy_type].collection.size() >= 0 )  || live_enemies >= max_concurrent_enemies:
		return null
	var new_enemy = enemy_pools[enemy_type].add(get_tree().current_scene)
	new_enemy.global_position = pos
	live_enemies+=1
	enemies_spawned += 1
	pass


func _process(delta):
	'''
	Every second, pick a random tile.
	if that tile is a floor tile, get its position
	if that position is beyond a certain distance from the player,
	spawn an enemy there.
	Add to current enemy count
	'''
	if enemies_spawned >= enemy_package.all_time_spawns || live_enemies >= max_concurrent_enemies:
		return
	time_since_check += delta
	if time_since_check > spawn_time:
		time_since_check -= spawn_time
		try_spawn()

func try_spawn():
	# Get a random tile.
	# check if its spawnable
	var map_size = level_generator.size
	var tile_size = level_generator.tile_size
	var tile = Vector2( randi()% map_size.x, randi() % map_size.y)
	if level_generator.get_tile_type(tile) == "floor":
		var true_pos = Vector2(tile_size * tile)
		if (player.position - true_pos).length() > min_dist_from_player:
			
			spawn_enemy(true_pos, pick_rand_enemy())


func pick_rand_enemy():
	var chance = randf_range(0,1)
	for enemy in enemy_odds:
		if chance <= enemy.odds:
			return enemy.name
