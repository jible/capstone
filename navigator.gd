extends NavigationAgent2D
class_name Navigator

## Updates the path every x seconds

var path: PackedVector2Array
var target: Node2D
var timer: Timer


func update_target_pos(pos):
	target_position = pos
	pass
