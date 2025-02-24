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
@export var wall_layer : TileMap
var inventory: Inventory = Inventory
@export var drag_coefficient: float
@onready var drag:float  = 1.0 - drag_coefficient

func _ready():
	Globals.player = self
	SignalBus.player_stat_upgraded.connect(update_stats)
	


func _physics_process(_delta):
	mobility_manager.input_direction = InputManager.get_move_vector()
	move_and_slide()

func get_direction():
	return InputManager.get_look_vector(position)

func update_stats(stat_name: String):
	Callable(self, "update_%s" %stat_name).call()
	SignalBus.update_HUD.emit()
	
func update_health():
	print("health")
	health_manager.increase_max_health(UpgradeManager.get_stat(UpgradeManager.HEALTH))
	
func update_speed():
	print("speed")
	mobility_manager.increase_max_speed_mult(UpgradeManager.get_stat(UpgradeManager.SPEED))
	mobility_manager.increase_max_accel_mult(UpgradeManager.get_stat(UpgradeManager.SPEED))
	
func update_dmg():
	print("dmg")
	hitbox.increase_damage(UpgradeManager.get_stat(UpgradeManager.DMG))


func _on_wall_collision_area_body_entered(body):
	
	print(body)
