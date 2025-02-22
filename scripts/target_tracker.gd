extends Node
class_name TargetTracker

var character: CharacterBody2D
var target: Node2D

func _ready():
	pass

func get_target_position():
	target = Globals.player
	if target && target.global_position:
		return target.global_position
	return null
	
	
# This is super empty but it helped split things up so I didn't have to store a reference to the 
# target in another node that isn't supposed to serve that pupose
# I foresee this being used for more in the future, so I'm going to keep it as is.
