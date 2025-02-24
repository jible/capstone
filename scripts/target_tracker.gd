extends Area2D
class_name TargetTracker

@export var character: CharacterBody2D
@export var group_to_detect: String = "Player"

var overlaps = []

signal new_target(target)

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", on_body_entered)
	connect("body_exited", on_body_exited)


func get_target():
	if overlaps.size() <= 0:
		return null
	return overlaps [0]


func on_body_entered(body):
	if group_to_detect in body.get_groups():
		overlaps.append(body)
		target_changed()

func on_body_exited(body):
	if group_to_detect in body.get_groups():
		overlaps.erase(body)
		target_changed()
	pass


func target_changed():
	var target = get_target()
	emit_signal("new_target", target)


func get_target_position():
	if overlaps.size() <= 0:
		return Vector2.ZERO
	return overlaps [0].global_position
