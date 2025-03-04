extends Node

@export var character:CharacterBody2D
@export var lock_direction = false
@export var movement_details =  {
	"moveable" : true,
	"max_speed_mult": 3,
	"acceleration_mult": .5,
	"drag_mult": .9
}
@export var animation_name = "death"
var dash_velocity = 2000
@export var speaker : AudioStreamPlayer2D
# Other variables
@onready var sm = get_parent()
var sfx = SoundManager
var callbacks = {
	"start" : Callable(self, "velocity_impulse"),
	"end" : Callable(self, "end_dash")
}
var direction_dependent = false
var is_active = false

func end_dash():
	sm.change_state("Idle")
	

func velocity_impulse():
	character.mobility_manager.set_velocity(dash_velocity * InputManager.get_move_vector())
	
func update_state(delta):
	pass
func enter_state():
	sfx.play_player_sound(speaker, sfx.PlayerSounds.DASH)
	pass
func exit_state():
	pass
