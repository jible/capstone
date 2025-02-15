extends Node

@export var hitbox: HitBox
@export var me: CharacterBody2D
@onready var sm = get_parent()
@export var lock_direction = false
@export var movement_details =  {}
@export var animation_name = "pursuit"
var callbacks = {}
@export var mobility_manager: Node2D
var player: CharacterBody2D
var direction_dependent = true


func _ready():
	player = Globals.get_player()


func update_state(delta):
	if (!is_instance_valid(player)):
		player = Globals.get_player()
	if (player):
		var target_vector = player.global_position - me.global_position
		if (target_vector.length() < 10):
			target_vector = Vector2.ZERO
		else:
			target_vector = target_vector.normalized()
		mobility_manager.input_direction = target_vector
	pass


func enter_state():
	# turn on hitbox
	hitbox.turn_on()
	pass
	
func exit_state():
	# turn off hitbox
	hitbox.turn_off()
	
	mobility_manager.input_direction = Vector2.ZERO
	pass
