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
@export var speaker: AudioStreamPlayer2D
@export var silhouette: AnimatedSprite2D
var inventory: Inventory = Inventory
@export var drag_coefficient: float

func _ready():
	Globals.player = self
	grab_upgrades()
	grab_health()
	SignalBus.player_stat_upgraded.connect(update_stat)
	SignalBus.level_completed.connect(store_health)

func _physics_process(_delta):
	mobility_manager.input_direction = InputManager.get_move_vector()
	move_and_slide()

func get_direction():
	return InputManager.get_look_vector(position)
	
func set_base_stats():
	#health_manager.increase_max_health(UpgradeManager.get_stat(UpgradeManager.HEALTH))
	pass
	
func grab_upgrades():
	update_health()
	update_speed()
	update_dmg()
	
func grab_health():
	health_manager.health = Inventory.health
	SignalBus.update_HUD.emit()

func update_stat(stat_name: String):
	Callable(self, "update_%s" %stat_name).call()
	SignalBus.update_HUD.emit()
	
func update_health():
	health_manager.increase_health_from_base(UpgradeManager.get_stat(UpgradeManager.HEALTH))
	
func update_speed():
	mobility_manager.max_speed_mult = UpgradeManager.get_stat(UpgradeManager.SPEED)
	mobility_manager.max_accel_mult = UpgradeManager.get_stat(UpgradeManager.SPEED)
	
func update_dmg():
	hitbox.increase_damage(UpgradeManager.get_stat(UpgradeManager.DMG))
	
func store_health():
	Inventory.health = health_manager.health
