extends SMState

# Exports
@export var character: CharacterBody2D
@export var lock_direction = true
@export var movement_details =  {
	"max_speed_mult" : 100
}
@export var animation_name = "attack"
@export var vel_impulse = 3000
@export var speaker : AudioStreamPlayer2D

# On readys
@onready var sm = get_parent()
var sfx = SoundManager
var direction_dependent = false
var callbacks = {
	"end": Callable(self, "anim_done")
}
var is_active = false

func anim_done():
	sm.change_state("Idle")
# Main Functions
func update_state(delta):
	pass
func enter_state():
	character.mobility_manager.apply_impulse( (character.navigator.get_next_step() - character.position).normalized() * vel_impulse)
	character.hitbox.turn_on()
	sfx.play_entity_sound(speaker,sfx.EntitySounds.ATTACK)


func exit_state():
	character.hitbox.turn_off()
