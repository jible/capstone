class_name Player
extends CharacterBody2D

@onready var mobility_manager: Mobility= $"Mobility Manager"
@onready var health_manager: Health= $"Health Manager"
@onready var inventory: Inventory= $"Inventory"
@export var drag_coefficient: float
@onready var drag:float  = 1.0 - drag_coefficient

func _physics_process(_delta):
	mobility_manager.input_direction = InputManager.get_move_vector()
	move_and_slide()

func get_direction():
	return InputManager.get_look_vector(position)

func _ready():
	SignalBus.player_stats_updated.connect(update_stats)

func update_stats():
	health_manager.increase_starting_health(UpgradeManager.get_stat("health"))
	#Speed auto updates from upgrade manager global data
	#Damage updates in res://scripts/characters/hitbox.gd
