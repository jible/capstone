extends SMState

# Exports
@export var lock_direction = true
@export var movement_details =  {}
@export var animation_name = "death"
@export var speaker : AudioStreamPlayer2D

# Variables
@onready var sm = get_parent()
var sfx = SoundManager
var direction_dependent = false
var is_active = false
var callbacks = {
	"end": Callable(self,"anim_end")
}

# Signals
signal died

# Callback functions
func anim_end():
	emit_signal("died")
	pass

# Main Functions
func update_state(delta):
	pass
func enter_state():
	sfx.play_entity_sound(speaker,sfx.EntitySounds.DEATH)
	pass
func exit_state():
	pass
