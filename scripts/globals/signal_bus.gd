extends Node

signal upgrade_stat_button_pressed(stat_name: String)

signal player_stats_updated()

# emit when player is damaged/healed
signal player_health_updated()

signal player_die()
