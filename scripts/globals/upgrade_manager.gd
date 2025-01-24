extends Node

#ref to player
#@onready var player = 

#upgradable stats
var health_mult = 1
var dmg_increase = 0
var speed_mult = 1

#amount to increase upgrades by
@export_category("Upgrade Growth")
@export var health_up = .2
@export var dmg_up = .5
@export var speed_up = .2

func _ready():
	SignalBus.upgrade_stat_button_pressed.connect(_on_stat_upgraded)

# ALL STATS SHOULD HAVE A METHOD ACCORDING TO THIS CONVENTION
# func upgrade_{stat_name}():

func upgrade_health():
	health_mult+= health_up
	
func upgrade_dmg():
	dmg_increase+= dmg_up
	
func upgrade_speed():
	speed_mult+= speed_up

func _on_stat_upgraded(stat_name: String):
	Callable(self, "upgrade_%s" %stat_name).call()
	#notify player to update self
	SignalBus.player_stats_updated.emit()
