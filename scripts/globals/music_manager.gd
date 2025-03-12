extends AudioStreamPlayer

const MAIN_MENU : AudioStreamMP3 = preload("res://assets/audio/main_menu.mp3")
const DEATH_SCREEN : AudioStreamMP3 = preload("res://assets/audio/death_screen.mp3")
const LUST : AudioStreamMP3 = preload("res://assets/audio/lust_music.mp3")

@export var muted : bool = false
# Use this to control the volume of the music.
var volume_mult : float = 1.0

const VOLUMES = {
	MAIN_MENU : -15.0,
	LUST : 0.0,
	DEATH_SCREEN : 0.0
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	change_song(MAIN_MENU)

func mute_music():
	muted = true
func unmute_music():
	muted = false
	
func change_song(song : AudioStreamMP3):
	stream = song
	volume_db = VOLUMES[song] * volume_mult
	if muted == false:
		play()
