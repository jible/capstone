extends Node


@export var max_speed: int
@export var acceleration: int
@onready var sm = get_parent()


func update_state(delta):
	#print("I run every frame when this is the current state")
	pass
func enter_state():
	print ("I run once when the state machine changes to this state")
	pass
func exit_state():
	print(" I run once when this is the current state and change state is called")
	pass
