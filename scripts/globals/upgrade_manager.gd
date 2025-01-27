extends Node 

#upgradable stats
var health_increase = 0
var dmg_increase = 0
var speed_increase = 0

#amount to increase upgrades by
@export_category("Upgrade Growth")
@export var health_up = 1
@export var dmg_up = 1
@export var speed_up = 50

func _ready():
	SignalBus.upgrade_stat_button_pressed.connect(_on_stat_upgraded)

# ALL STATS SHOULD HAVE A METHOD ACCORDING TO THIS CONVENTION
# func upgrade_{stat_name}():

func upgrade_health():
	health_increase+= health_up
	
func upgrade_dmg():
	dmg_increase+= dmg_up
	
func upgrade_speed():
	speed_increase+= speed_up

func _on_stat_upgraded(stat_name: String):
	Callable(self, "upgrade_%s" %stat_name).call()
	#notify player to update self
	SignalBus.player_stats_updated.emit()
