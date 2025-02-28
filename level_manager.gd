extends Node

var current_level_index = 0
var level_scene_reference

func _ready():
	level_scene_reference = preload("res://scenes/prefabs/scene_config_package.tscn")


var level_order = [
	"limbo_1",
	"limbo_2",
	"limbo_3",
	"lust_1",
]

var level_packages = {
	"limbo_1" : {
		"width": 100,
		"height": 100,
		"floor_tiles": 1200,
		"gen_method": "walk",
		"items" : [],
		"end_distance": 100,
		"tile_set": "path?"
	},
	"limbo_2" : {
		"width": 100,
		"height": 100,
		"floor_tiles": 1700,
		"gen_method": "walk",
		"items" : [],
		"end_distance": 100,
		"tile_set": "path?"
	},
	"limbo_3" : {
		"width": 100,
		"height": 100,
		"floor_tiles": 1700,
		"gen_method": "walk",
		"items" : [],
		"end_distance": 100,
		"tile_set": "path?"
	},
	
	
	"lust_1" : {
		"width": 100,
		"height": 100,
		"floor_tiles": 1700,
		"gen_method": "walk",
		"items" : [],
		"end_distance": 100,
		"tile_set": "path?"
	},
}


func go_next_level():
	current_level_index += 1
	Globals.change_scene( level_scene_reference )


func get_current_package():
	return level_packages[level_order [ current_level_index ] ]
