extends SMState

# Exports
@export var max_speed: int
@export var acceleration: int
@export var lock_direction = false
@export var hitbox: HitBox
@export var speaker : AudioStreamPlayer2D
var sfx = SoundManager
@export var movement_details =  {
	"moveable" : true
}
var direction_dependent = true

@export var animation_name = "attack"
var callbacks = {
	"start": Callable(self, "turn_on_hitbox"),
	2: Callable(self, "turn_off_hitbox"),
	"end": Callable(self, "end"),
}


# Onreadys
@onready var sm = get_parent()


func turn_on_hitbox():
	hitbox.turn_on()
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
