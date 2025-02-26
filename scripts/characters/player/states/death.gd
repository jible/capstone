extends SMState

# Exports
@export var death_scene :String = "res://scenes/testScenes/main_menu.tscn"
@export var character: CharacterBody2D
@export var lock_direction = false
@export var movement_details =  {}

# Other variables
@onready var speaker: AudioStreamPlayer2D = character.speaker
var sfx = SoundManager
var animation_name = "death"
var is_active = false
var direction_dependent = false
var callbacks = {
	"end": Callable(self, "done"),
}

func done():
	print("dead")
	SignalBus.player_die.emit()
	Globals.change_scene(load(death_scene))
	
func update_state(delta):
	pass


func enter_state():
	sfx.play_player_sound(speaker,sfx.PlayerSounds.DEATH)
	character.hurtbox.turn_off()
	Globals.player = null
	pass


func exit_state():
	pass
