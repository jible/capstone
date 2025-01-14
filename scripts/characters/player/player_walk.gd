extends Node


var mobility = "Default"
@export var max_speed: int
@export var acceleration: int
@onready var sm = get_parent()
@export var player:CharacterBody2D

func update_state(delta):
	if Input.is_action_pressed("run"):
		sm.change_state("Run")
	elif player.velocity.length() < 5:
		sm.change_state("Idle")
	pass
func enter_state():
	pass
func exit_state():
	pass
