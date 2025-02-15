extends Node 

# upgradable stats
# hp and dmg are flat increases, starting at 0
# speed is a mult increase, should start at 1
# TODO
# delink level from stat increase
# start levels at 0,
# convert to indices of an upgrades array (source of truth)
var stat_lvl: Dictionary = {
	"health": 0,
	"dmg": 0,
	"speed": 1
}
#amount to increase upgrades by
var upgrade_growth: Dictionary = {
	"health": 1,
	"dmg": 1,
	"speed": 1.2
}
var upgrade_cost = 1

#Inventory ref from player
@onready var inventory: Inventory = get_tree().get_first_node_in_group("Inventory")

func _ready():
	SignalBus.upgrade_stat_button_pressed.connect(_on_stat_upgraded)
	
func check_can_upgrade(stat: String) -> bool:
	if get_upgrade_cost(stat) <= inventory.check_item(Globals.currency_key):
		return true
	return false

func upgrade_stat(stat: String):
	stat_lvl[stat] += 1
	
#TODO convert to use array indices from csv
func get_stat(stat: String):
	return stat_lvl[stat] * upgrade_growth[stat]

func get_stat_lvl(stat: String):
	return stat_lvl[stat]
	
#TODO convert to use array indices from csv
func get_upgrade_cost(stat: String):
	if get_stat_lvl(stat) == 0:
		return upgrade_cost
	else:
		return get_stat_lvl(stat) * upgrade_cost

func remove_currency(stat: String):
	inventory.items[Globals.currency_key] -= get_upgrade_cost(stat)
	SignalBus.currency_changed.emit()

# Upgrades: 
# health in res://scripts/characters/player/player.gd
# dmg in res://scripts/characters/hitbox.gd
# speed in res://scripts/characters/mobility_manager.gd
# all linked to player_stats_updated signal
func _on_stat_upgraded(stat_name: String):
	if check_can_upgrade(stat_name):
		remove_currency(stat_name)
		upgrade_stat(stat_name)
	#notify player to update self
	SignalBus.player_stats_updated.emit()
