extends SMState

@export var death_scene :String = "res://scenes/testScenes/main_menu.tscn"
@export var character: CharacterBody2D
@export var lock_direction = false
@export var movement_details =  {}
var animation_name = "death"
var direction_dependent = false
var callbacks = {}

func update_state(delta):
	pass
func enter_state():
	character.hurtbox.turn_off()
	SignalBus.player_die.emit()
	Globals.change_scene(load(death_scene))
	pass
func exit_state():
	pass
