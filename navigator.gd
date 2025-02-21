extends NavigationAgent2D
class_name Navigator

## Updates the path every x seconds
@export var calc_path_frequency: float = 1

var character:CharacterBody2D
var path: PackedVector2Array
var target: Node2D
var timer: Timer

func _ready():
	character = get_parent()
	make_timer()


func make_timer():
	timer = Timer.new()
	timer.one_shot = false
	timer.autostart = true
	add_child(timer)
	timer.start()


func update_target(target_char):
	target = target_char
	target_position = target.position
	pass
