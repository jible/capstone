extends Node2D

# Player Sound Setup
enum playerSounds {WALK,HURT,DEATH}
var playerSoundLibrary: Array[AudioStreamWAV] = []
var playerSoundSettings: Array[SoundSetting] = [] 

# UI Sound Setup
# Entity Sound Setup
# Environment Sound Setup
# Music Sound Setup

func createSound(soundLib: Array[AudioStreamWAV], settingLib:Array[SoundSetting],index:int,soundFile:AudioStreamWAV,volume:float,pitch:float,attenuation:float):
	soundLib[index] = soundFile
	settingLib[index] = SoundSetting.new(volume, pitch, attenuation)

func loadPlayerSounds():
	# Make space for sounds based on number of elements in enum.
	playerSoundLibrary.resize(playerSounds.keys().size())
	playerSoundSettings.resize(playerSounds.keys().size())
	
	createSound(playerSoundLibrary, playerSoundSettings, playerSounds.HURT, load("res://assets/audio/prototype/ESCAPE_1.wav"), 0.0,1.0,1.0)
	createSound(playerSoundLibrary, playerSoundSettings, playerSounds.WALK, load("res://assets/audio/prototype/ESCAPE_2.wav"), 0.0,1.0,1.0)
	createSound(playerSoundLibrary, playerSoundSettings, playerSounds.DEATH, load("res://assets/audio/prototype/FAILURE_1.wav"), 0.0,1.0,1.0)
	
func playPlayerSound(speaker:AudioStreamPlayer2D, soundIndex : int):
	speaker.volume_db = playerSoundSettings[soundIndex].volume_db
	speaker.pitch_scale = playerSoundSettings[soundIndex].pitch_scale
	speaker.pitch_scale = playerSoundSettings[soundIndex].pitch_scale
	speaker.stream = playerSoundLibrary[soundIndex]
	speaker.play()
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
