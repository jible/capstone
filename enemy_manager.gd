extends Node

@export var level_generator: Node2D
const enemy_types: Array[PackedScene] = [
	preload("res://scenes/prefabs/npcs/enemies/basic_enemy.tscn"),
]

var alive_enemies = 0
var killed_enemies = 0

var time_since_check = 0
var spawn_time = 1.5

func enemy_killed(enemy):
	alive_enemies -= 1
	killed_enemies += 1
	pass

func spawn_enemy(pos, enemy = null):
	if enemy == null:
		enemy = randi()% enemy_types.size()
		var instance = enemy.instantiate()
		get_tree().current_scene.add_child(instance)
		instance.position = pos
		pass
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
		try_spawn()
		time_since_check = 0
	pass

func try_spawn():
	# Get a random tile.
	# check if its spawnable
	pass
	
	
