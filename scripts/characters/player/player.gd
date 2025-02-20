class_name Player
extends CharacterBody2D

@export var mobility_manager : MobilityManager
@export var state_machine: StateMachine
@export var hitbox: HitBox
@export var hurtbox: HurtBox
@export var sprite_manager: AnimationManager
@export var direction_manager: DirectionManager
@export var health_manager: Health
@export var pick_up: PickUp
var inventory: Inventory = Inventory
@export var drag_coefficient: float
@onready var drag:float  = 1.0 - drag_coefficient

func _physics_process(_delta):
	mobility_manager.input_direction = InputManager.get_move_vector()
	move_and_slide()

func get_direction():
	return InputManager.get_look_vector(position)

func _ready():
	Globals.player = self
	SignalBus.player_stats_updated.connect(update_stats)

func update_stats():
	health_manager.increase_max_health(UpgradeManager.get_stat(UpgradeManager.HEALTH))
	mobility_manager.increase_max_speed_mult(UpgradeManager.get_stat(UpgradeManager.SPEED))
	mobility_manager.increase_max_accel_mult(UpgradeManager.get_stat(UpgradeManager.SPEED))
	hitbox.increase_damage(UpgradeManager.get_stat(UpgradeManager.DMG))
