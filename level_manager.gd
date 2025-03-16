extends Node

var current_level_index = 0
var level_scene_reference
var current_package 
var exit_instance
#TODO hard path listed here
@onready var main_menu = preload("res://scenes/testScenes/main_menu.tscn")

func _ready():
	update_current_package()
	level_scene_reference = preload("res://scenes/prefabs/scene_config_package.tscn")
	SignalBus.player_die.connect(reset_levels)
	SignalBus.required_enemies_killed.connect(enable_exit)

var level_order = [
	"limbo_1",
	"limbo_2",
	"limbo_3",
]

var default_enemy_package = {
	"max_concurrent_enemies": 5,
	"required_enemies" : 1,
	"all_time_spawns": 10,
	"enemy_types":[
		{
			"name" : "infinimouth",
			"pool_size": 50,
			"frequency": 1
		}
	]
}


var default_package = {
	"name": "limbo_1",
	"width": 100,
	"height": 100,
	"floor_tiles": 1200,
	"gen_method": "walk",
	"items" : [],
	"end_distance": 100,
	"tile_set": "path?",
	"next_tile_index" : 1,
	"enemy_package": default_enemy_package,
}


var level_packages = {
	# LIMBO SECTION
	# Limbo_1 can use the default for now. Modify it as you see fit.
	"limbo_1" : {
		"enemy_package" :{
			"max_concurrent_enemies": 5,
			"required_enemies" : 3,
			"all_time_spawns": 10,
			"enemy_types":[
				{
					"name" : "infinimouth",
					"pool_size": 50,
					"frequency": 1
				}
			]
		}
	}, 
	"limbo_2" : {
		"enemy_package" :{
			"max_concurrent_enemies": 5,
			"required_enemies" : 7,
			"all_time_spawns": 15,
			"enemy_types":[
				{
					"name" : "infinimouth",
					"pool_size": 50,
					"frequency": 1
				}
			]
		},
		"name": "limbo_2",
		"width": 100,
		"height": 100,
		"floor_tiles": 1700,
		"gen_method": "walk",
		"items" : [],
		"end_distance": 100,
		"tile_set": "path?"
	},
	"limbo_3" : {
		"name": "limbo_3",
		"enemy_package" :{
			"max_concurrent_enemies": 7,
			"required_enemies" : 10,
			"all_time_spawns": 15,
			"enemy_types":[
				{
					"name" : "infinimouth",
					"pool_size": 50,
					"frequency": 1
				}
			]
		},
		"width": 100,
		"height": 100,
		"floor_tiles": 1700,
		"gen_method": "walk",
		"items" : [],
		"end_distance": 100,
		"tile_set": "path?"
	},
}

# Public functions
func reset_levels():
	current_level_index = 0
	update_current_package()
	
func link_exit(exit):
	exit_instance = exit
	if current_package.enemy_package.required_enemies <= 0:
		exit_instance.turn_on()
	
func enable_exit():
	exit_instance.turn_on()

func go_next_level():
	current_level_index += 1
	if current_level_index >= level_order.size():
		current_level_index = 0
		ScoreManager.score = 0
		Globals.change_scene( main_menu )
		MusicManager.change_song(MusicManager.MAIN_MENU)
		return
	update_current_package()
	Globals.change_scene( level_scene_reference )


func get_current_package():
	return current_package


# Private functions
func update_current_package():
	var package = level_packages[level_order [ current_level_index ] ]
	current_package = clean_up_package( package ) 

# Takes package and fills it with default values in indicies that are not set
func clean_up_package(package):
	var new_package = default_package
	for key in package.keys():
		new_package[key] = package [key]
	return new_package
