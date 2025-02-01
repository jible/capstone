extends Node

var map
# Called when the node enters the scene tree for the first time.
func _ready():
	map = Map.new()
	map.randomWalk()
	
