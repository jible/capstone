extends Node 

#upgradable stats
# TODO
# delink level from stat increase, convert to indices of an upgrades array (source of truth)
# hp and dmg are flat increases, starting at 0
var health_lvl: int = 0
var dmg_lvl: int = 0
# speed is a mult increase, should start at 1
var speed_lvl: int = 1

#amount to increase upgrades by
@export_category("Upgrade Growth")
@export var health_up = 1
@export var dmg_up = 1
@export var speed_up = 1.2
@export var upgrade_cost = 1
@export var currency_name: String = "money"

#Inventory ref from player
@onready var inventory: Inventory = get_tree().get_nodes_in_group("Inventory")[0]

func _ready():
	SignalBus.upgrade_stat_button_pressed.connect(_on_stat_upgraded)
	
func check_can_upgrade(upgrade_lvl: int) -> bool:
	if upgrade_lvl+1 * upgrade_cost <= inventory.check_item(currency_name):
		return true
	return false

# ALL STATS SHOULD HAVE A METHOD ACCORDING TO THIS CONVENTION
# func upgrade_{stat_name}():

#Upgrades in res://scripts/characters/player/player.gd
func upgrade_health():
	health_lvl+=1
	
func get_health():
	return health_lvl*health_up
	
func get_health_lvl():
	return health_lvl

#Upgrades in res://scripts/characters/hitbox.gd
func upgrade_dmg():
	dmg_lvl+=1
	
func get_dmg():
	return dmg_lvl*dmg_up
	
func get_dmg_lvl():
	return dmg_lvl
	
#Upgrades player acceleration in res://scripts/characters/mobility_manager.gd
func upgrade_speed():
	speed_lvl+=1
	
func get_speed():
	return speed_lvl*speed_up
	
func get_speed_lvl():
	return speed_lvl

func _on_stat_upgraded(stat_name: String):
	if check_can_upgrade(Callable(self, "get_%s_lvl" %stat_name).call()):
		Callable(self, "upgrade_%s" %stat_name).call()
	#notify player to update self
	SignalBus.player_stats_updated.emit()
