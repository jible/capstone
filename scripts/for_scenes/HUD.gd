extends Control

var test = 0
@onready var upgrade_menu = $StatUpgradeUi
@onready var upgrade_menu_button = $Border/UpgradeMenuButton

@onready var health_bar: ProgressBar = %HealthBar
@onready var currency_count: Label = %CurrencyCount
@onready var player: Player = get_tree().get_first_node_in_group("Player")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.update_HUD.connect(update_player_info)
	SignalBus.player_health_updated.connect(update_health)
	SignalBus.currency_changed.connect(update_currency)
	update_health()
	update_currency()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("OpenUpgrades"):
		toggle_upgrade_menu()
	
func _on_upgrade_menu_button_pressed() -> void:
	toggle_upgrade_menu()
	
func toggle_upgrade_menu():
	upgrade_menu.set_visible(!upgrade_menu.visible)
	
func update_player_info():
	#Updates health bar when player upgrades health
	update_health()
	update_currency()
	
func update_health():
	health_bar.max_value = player.health_manager.max_health
	health_bar.value = player.health_manager.health

func update_currency():
	if Inventory.check_item(Globals.currency_key):
		currency_count.text = "%d" % Inventory.items[Globals.currency_key]
