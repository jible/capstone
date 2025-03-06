extends Node
class_name ItemManager

#TODO hard-coded-path
@export var base_collectible = preload("res://scenes/prefabs/collectible.tscn")

# TODO- Hard-coded-path here. Update in file hierarchy refactor
var item_types = {
	"default":{
		"type": Globals.currency_key,
		"point_value": 1,
		"sprite_frames": null,
		"particle": null,
	},
	"currency": {
		"type" : Globals.currency_key,
		"sprite_frames" : preload("res://scenes/prefabs/collectible.tres"),
		"particle" : preload("res://assets/images/particle.jpg")
	},
	"health" :{
		"type" : "health",
		"sprite_frames": preload("res://scenes/prefabs/health_pick_up.tres"),
		"particle" :preload("res://assets/images/particle.jpg")
	}
}

func spawn_item(drop_type, position):
	var item_info = item_types.get(drop_type, null)
	if item_info == null:
		return null
	
	var instance = base_collectible.instantiate()
	instance.position = position
	instance.prep(item_types[drop_type])
	get_tree().current_scene.add_child(instance)
