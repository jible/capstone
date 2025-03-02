extends AudioStreamPlayer

const MAIN_MENU = preload("res://assets/audio/main_menu.wav")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	change_song(MAIN_MENU)

func change_song(song : AudioStreamWAV):
	stream = song
	play()
