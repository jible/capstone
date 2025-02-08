extends Control

var test = 0
@onready var upgrade_menu = $"StatUpgradeUi"
@onready var menu_button = $"Button"
@onready var health_bar: ProgressBar = $"PlayerInfo/MarginContainer/HBoxContainer/VBoxContainer/Health/HealthBar"
@onready var health_label: Label = $"PlayerInfo/MarginContainer/HBoxContainer/VBoxContainer/Health/HealthLabel"
#Refence for player grabbed from scene tree
@onready var player: Player = get_tree().get_nodes_in_group("Player")[0]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.player_stats_updated.connect(update_player_info)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("OpenUpgrades"):
		toggle_upgrade_menu()
	
func _on_button_pressed() -> void:
	toggle_upgrade_menu()
	
func toggle_upgrade_menu():
	upgrade_menu.set_visible(!upgrade_menu.visible)
	
func update_player_info():
	#Updates health bar when player upgrades health
	health_bar.max_value = player.health_manager.max_health
	health_label.text = "%d/%d" % [player.health_manager.health, player.health_manager.max_health]
