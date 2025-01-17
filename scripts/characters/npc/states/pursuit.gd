extends Node


@export var me: CharacterBody2D
@export var max_speed: int
@export var acceleration: int
@onready var sm = get_parent()
@onready var mobility_manager = get_parent().mobility_manager
var player: CharacterBody2D

func _ready():
	var players = get_tree().get_nodes_in_group("Player")
	if players:
		player = players[0].character

func update_state(delta):
	if (player):
		var target_vector = player.global_position - me.global_position
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
