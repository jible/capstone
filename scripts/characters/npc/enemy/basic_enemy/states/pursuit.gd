extends Node


@export var me: CharacterBody2D
@onready var sm = get_parent()
@export var lock_direction = false
@export var movement_details =  {}
@export var animation = {
	"frames": [3,4,5],
	"framerate": 4
}
@export var mobility_manager: Node2D
var player: CharacterBody2D

func _ready():
	var players = get_tree().get_nodes_in_group("Player")
	if players:
		player = players[0]

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
