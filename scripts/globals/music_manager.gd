extends AudioStreamPlayer

const MAIN_MENU : AudioStreamWAV = preload("res://assets/audio/main_menu.wav")
const LUST : AudioStreamWAV = preload("res://assets/audio/lust_music.wav")

const VOLUMES = {
	MAIN_MENU : -15.0,
	LUST : 0.0
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	change_song(MAIN_MENU)

func change_song(song : AudioStreamWAV):
	stream = song
	volume_db = VOLUMES[song]
	play()
