extends Control

var test = 0
@onready var upgrade_menu = %StatUpgradeUi
@onready var menu_button = %Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("OpenUpgrades"):
		toggle_upgrade_menu()
	
func _on_button_pressed() -> void:
	toggle_upgrade_menu()
	
func toggle_upgrade_menu():
	upgrade_menu.set_visible(!upgrade_menu.visible)
