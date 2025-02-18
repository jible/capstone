extends SMState

@export var health_manager: Health
@export var hurtbox: HurtBox
@export var character:CharacterBody2D
@export var mobility_manager: Node2D
@export var lock_direction = true
@export var invincibility_time: float = 2
@export var knockback_velocity: float = 1800

# Sound Stuff
@export var speaker : AudioStreamPlayer2D
var sfx = SoundManager

@export var movement_details =  {
	"moveable": false
}
@onready var sm = get_parent()
@export var animation_name = "hurt"
var direction_dependent = true

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
