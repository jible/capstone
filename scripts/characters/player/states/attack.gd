extends SMState

# Exports
@export var character :CharacterBody2D
@export var max_speed: int
@export var acceleration: int
@export var lock_direction = false
@export var speaker : AudioStreamPlayer2D
@export var animation_name = "attack"
@export var movement_details =  {
	"moveable" : true
}
@export var particle_swing : CPUParticles2D

# Other variables
@onready var sm : StateMachine = get_parent()
@onready var hitbox : HitBox = character.hitbox
var sfx = SoundManager
var direction_dependent = true
var is_active = false
var callbacks = {
	"start": Callable(self, "turn_on_hitbox"),
	2: Callable(self, "turn_off_hitbox"),
	"end": Callable(self, "end"),
}

# Frame specific functions
func turn_on_hitbox():
	hitbox.turn_on()
	particle_swing.emitting = true
	pass

func turn_off_hitbox():
	hitbox.turn_off()
	pass

func end():
	sm.change_state("Idle")

# Main Functions
func update_state(_delta):
	pass
func enter_state():
	sfx.play_player_sound(speaker,sfx.PlayerSounds.ATTACK)
	pass
func exit_state():
	turn_off_hitbox()
	pass
