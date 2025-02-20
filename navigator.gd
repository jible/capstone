extends Node
class_name Navigator

var character:CharacterBody2D
var map: RID
var path: PackedVector2Array
var target: Node2D
var target_position: Vector2

func _ready():
	character = get_parent()


func update_map():
	map = NavigationServer2D.get_maps()[0]
	return map

func get_next_point():
	if update_map() == null:
		return null
	calc_path()
	return path [0]


func update_target(target_char):
	target = target_char
	target_position = target.global_position
	pass


func calc_path():
	path = NavigationServer2D.map_get_path(map, character.global_position, target_position, true)
