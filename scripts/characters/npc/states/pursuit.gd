extends Node


@export var me: CharacterBody2D
@export var max_speed: int
@export var acceleration: int
@onready var sm = get_parent()
@onready var player = Globals.player
@onready var mobility_manager = get_parent().mobility_manager

func update_state(delta):
	if (player):
		var target_vector = player.position - me.position
		if (target_vector.length() < 10):
			target_vector = Vector2.ZERO
		else:
			target_vector = target_vector.normalized()
		mobility_manager.input_direction = target_vector
	pass
func enter_state():
	pass
func exit_state():
	mobility_manager.input_direction = Vector2.ZERO
	pass
