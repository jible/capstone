extends Node2D

@export var muted : bool = false

# Use this float to control volume for the sound effects
var volume_mult : float = 1.0

func mute_sfx():
	muted = true
func unmute_sfx():
	muted = false
	
func _ready() -> void:
	load_player_sounds()
	load_entity_sounds()
	load_ui_sounds()
	load_env_sounds()

# Player Sound Setup
enum PlayerSounds {
	PICKUP,
	HURT,
	DEATH,
	ATTACK,
	HEAL,
	DASH
}
var player_sound_library: Array[AudioStreamWAV] = []
var player_sound_settings: Array[SoundSetting] = [] 

# UI Sound Setup
enum UISounds {
	UPG_SUCCESS,
	UPG_FAIL,
	PAUSE,
	UNPAUSE,
}
var ui_sound_library: Array[AudioStreamWAV] = []
var ui_sound_settings: Array[SoundSetting] = [] 

# Entity Sound Setup
enum EntitySounds {
	DEATH,
	ATTACK,
	HURT
}
var entity_sound_library: Array[AudioStreamWAV] = []
var entity_sound_settings: Array[SoundSetting] = [] 

# Environment Sound Setup
enum EnvSounds {
	DOOR
}
var env_sound_library: Array[AudioStreamWAV] = []
var env_sound_settings: Array[SoundSetting] = [] 


func create_sound(sound_lib: Array[AudioStreamWAV], setting_lib:Array[SoundSetting],index:int,sound_file:AudioStreamWAV,volume:float,pitch:float,attenuation:float):
	sound_lib[index] = sound_file
	setting_lib[index] = SoundSetting.new(volume, pitch, attenuation)

# LOADERS	
func load_player_sounds():
	# Make space for sounds based on number of elements in enum.
	player_sound_library.resize(PlayerSounds.keys().size())
	player_sound_settings.resize(PlayerSounds.keys().size())
	
	# Add sounds to the libraries
	create_sound(player_sound_library, player_sound_settings, PlayerSounds.HURT, load("res://assets/audio/hurt.wav"), 20.0,1.0,1.0)
	create_sound(player_sound_library, player_sound_settings, PlayerSounds.PICKUP, load("res://assets/audio/tooth_pickup.wav"), 3.0,1.0,1.0)
	create_sound(player_sound_library, player_sound_settings, PlayerSounds.ATTACK, load("res://assets/audio/player_attack.wav"), 25.0,1.0,1.0)
	create_sound(player_sound_library, player_sound_settings, PlayerSounds.DEATH, load("res://assets/audio/player_death.wav"), 27.0,1.0,1.0)
	create_sound(player_sound_library, player_sound_settings, PlayerSounds.HEAL, load("res://assets/audio/heartbeat.wav"), 8.0,1.0,1.0)
	create_sound(player_sound_library, player_sound_settings, PlayerSounds.DASH, load("res://assets/audio/player_dash.wav"), 0.0,1.0,1.0)

func load_entity_sounds():
	entity_sound_library.resize(EntitySounds.keys().size())
	entity_sound_settings.resize(EntitySounds.keys().size())
	
	create_sound(entity_sound_library,entity_sound_settings, EntitySounds.DEATH, load("res://assets/audio/enemy_death.wav"),22.0,1.0,1.0)
	create_sound(entity_sound_library,entity_sound_settings, EntitySounds.ATTACK, load("res://assets/audio/enemy_attack.wav"),15.0,1.0,1.0)
	create_sound(entity_sound_library,entity_sound_settings, EntitySounds.HURT, load("res://assets/audio/enemy_hurt.wav"),8.0,1.0,1.0)
func load_ui_sounds():
	ui_sound_library.resize(UISounds.keys().size())
	ui_sound_settings.resize(UISounds.keys().size())
	
	create_sound(ui_sound_library, ui_sound_settings, UISounds.PAUSE, load("res://assets/audio/prototype/ESCAPE_1.wav"), 6.0,1.0,1.0)
	create_sound(ui_sound_library, ui_sound_settings, UISounds.UNPAUSE, load("res://assets/audio/prototype/ESCAPE_2.wav"), 6.0,1.0,1.0)
	create_sound(ui_sound_library, ui_sound_settings, UISounds.UPG_FAIL, load("res://assets/audio/prototype/FAILURE_1.wav"), 6.0,1.0,1.0)
	create_sound(ui_sound_library, ui_sound_settings, UISounds.UPG_SUCCESS, load("res://assets/audio/prototype/SUCCESS_2.wav"), 6.0,1.0,1.0)

func load_env_sounds():
	env_sound_library.resize(EnvSounds.keys().size())
	env_sound_settings.resize(EnvSounds.keys().size())
	
# PLAYERS
func play_player_sound(speaker:AudioStreamPlayer2D, sound_index : int):
	speaker.volume_db = player_sound_settings[sound_index].volume_db * volume_mult
	speaker.pitch_scale = player_sound_settings[sound_index].pitch_scale
	speaker.attenuation = player_sound_settings[sound_index].attenuation
	speaker.stream = player_sound_library[sound_index]
	if muted == false:
		speaker.play()
	
func play_ui_sound(speaker:AudioStreamPlayer, sound_index : int):
	speaker.volume_db = ui_sound_settings[sound_index].volume_db * volume_mult
	speaker.pitch_scale = ui_sound_settings[sound_index].pitch_scale
	speaker.stream = ui_sound_library[sound_index]
	if muted == false:
		speaker.play()
	
func play_entity_sound(speaker:AudioStreamPlayer2D, sound_index : int):
	speaker.volume_db = entity_sound_settings[sound_index].volume_db * volume_mult
	speaker.pitch_scale = entity_sound_settings[sound_index].pitch_scale
	speaker.attenuation = entity_sound_settings[sound_index].attenuation
	speaker.stream = entity_sound_library[sound_index]
	if muted == false:
		speaker.play()
	
func play_env_sound(speaker:AudioStreamPlayer2D, sound_index : int):
	speaker.volume_db = env_sound_settings[sound_index].volume_db * volume_mult
	speaker.pitch_scale = env_sound_settings[sound_index].pitch_scale
	speaker.attenuation = env_sound_settings[sound_index].attenuation
	speaker.stream = env_sound_library[sound_index]
	if muted == false:
		speaker.play()
	
