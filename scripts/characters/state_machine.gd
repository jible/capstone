class_name StateMachine
extends Node

# src = https://github.com/jible/BallGame/blob/main/Scripts/PlayerScripts/playerStates.gd

## This is the default state for the state machine
@export var default_state: String = "Nil"

# Attributes
@onready var character: CharacterBody2D = get_parent()
var state_names = []
var state_objects = {}
var current_state: String
var current_state_node = null

# Signals
signal state_changed

func _ready():
	state_objects = {}
	state_names = []
	for child in get_children():
		state_names.append(child.name)
		state_objects[child.name] = child
	change_state(default_state)
	
	
func _physics_process(delta):
	update_state(delta)
	
func change_state(new_state):
	if (new_state != current_state && new_state in state_names):
		if (current_state in state_names):
			exit_state(current_state)
		emit_signal("state_changed" , state_objects[new_state])
		current_state = new_state
		current_state_node = state_objects[current_state]
		enter_state(new_state)
	

func get_current_state_node():
	return (state_objects[current_state])


func update_state(delta):
	state_objects[current_state].update_state(delta)

# ---------------------------------------------------------------------------
# private functions:
func enter_state(new_state):
	state_objects[new_state].enter_state()

func exit_state(old_state):
	state_objects[old_state].exit_state()

# HOW  TO USE:
# You do not need to modify this file when you are using it. 
# Just add the states you want as children and set the default state in the editor

# SAMPLE STATE:
# copy and paste this code into a script on a new node as a child of this node
# name the node what you want the state to be changed
