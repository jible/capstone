extends Node

signal upgrade_stat_button_pressed(stat_name: String)

signal upgrade_success()

signal upgrade_fail()

signal player_stats_updated()

# emit when player is damaged/healed
signal player_health_updated()

signal player_die()

signal currency_changed()

signal item_collected(type: String, amount)
