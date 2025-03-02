extends Node

signal upgrade_stat_button_pressed(stat_name: String)

signal upgrade_success()

signal upgrade_fail()

signal player_stat_upgraded(stat_name: String)

signal update_HUD()

# emit when player is damaged/healed
signal player_health_updated()

signal player_die()

signal currency_changed()

signal item_collected(type: String, amount)

signal game_resumed()

signal required_enemies_killed()

signal level_completed()
