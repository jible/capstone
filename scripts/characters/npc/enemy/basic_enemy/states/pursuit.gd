extends Node

@export var hitbox: HitBox
@export var me: CharacterBody2D
@onready var sm = get_parent()
@export var lock_direction = false
@export var movement_details =  {}
@export var animation_name = "pursuit"
var callbacks = {}
@export var mobility_manager: Node2D
var player: Player
var direction_dependent = true
var path

func _ready():
	player = Globals.get_player()


func update_state(delta):

	player = Globals.player
	if (player):
		me.navigator.update_target(player)
		
		var target_vector =  me.navigator.get_next_path_position() - me.global_position 
		if target_vector == null:
			return
		if (target_vector.length() < 10):
			target_vector = Vector2.ZERO
		else:
			target_vector = target_vector.normalized()
		mobility_manager.input_direction = target_vector



func enter_state():
	# turn on hitbox
	hitbox.turn_on()
	pass
	
func exit_state():
	# turn off hitbox
	hitbox.turn_off()
	
	mobility_manager.input_direction = Vector2.ZERO
	pass
