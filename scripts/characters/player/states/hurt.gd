extends SMState

# Exports
@export var character:CharacterBody2D
@export var direction_dependent = true
@export var lock_direction = true
@export var invincibility_time: float = 2
@export var knockback_velocity: float = 1800
@export var animation_name = "hurt"
@export var movement_details =  {
	"moveable": false
}

# Node References
@onready var sm = get_parent()
@onready var health_manager = character.health_manager
@onready var hurtbox = character.hurtbox
@onready var mobility_manager = character.mobility_manager
# Sound Stuff
@onready var speaker = character.speaker
var sfx = SoundManager
# State Details
var callbacks = {
	"start": [
		#Callable(self, "temp_invincibility"),
		Callable(self, "knockback"),
	],
		"end": Callable(self, "end_hurt"),
}


func knockback():
	mobility_manager.set_velocity(knockback_velocity * hurtbox.latest_hit_direction)
	
func temp_invincibility():
	hurtbox.turn_off_for_sec(invincibility_time)

func turn_off_hurtbox():
	hurtbox.turn_off()
	pass
	
func turn_on_hurtbox():
	hurtbox.turn_on()
	
func end_hurt():
	if health_manager.health <= 0:
		sm.change_state("Death")
	else:
		sm.change_state("Idle")

func update_state(delta):
	pass
func enter_state():
	sfx.play_player_sound(speaker,sfx.PlayerSounds.HURT)
	print("HURT SOUND")
	pass
func exit_state():
	pass
