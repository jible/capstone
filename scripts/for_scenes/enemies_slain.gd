extends Control

@onready var header_label: Label = %HeaderLabel
@onready var count_label: Label = %CountLabel

var enemies_killed: int = 0
var required_enemies: int = LevelManager.get_current_package().enemy_package.required_enemies

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	SignalBus.connect("enemy_killed", update_count_label)
	SignalBus.connect("required_enemies_killed", update_header_label)

func update_count_label():
	#TODO
	# grab from enemy manager instead of tracking self
	enemies_killed += 1
	count_label.text = "%d / %d" % [enemies_killed, required_enemies]

func update_header_label():
	#TODO
	#Swap to use a translation keyed string
	count_label.text = "EXIT UNLOCKED"
