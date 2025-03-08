extends CharacterBody2D
class_name Infinimouth
# All children references
@export var mobility_manager: MobilityManager
@export var state_machine: StateMachine
@export var hitbox: HitBox
@export var hurtbox: HurtBox
@export var sprite_manager: AnimationManager
@export var health_manager: Health
@export var navigator: Navigator
@export var silhouette: AnimatedSprite2D
@export var target_tracker: TargetTracker
var type = "infinimouth"

@export var drop : PackedScene
var enemy_manager:Node = null

func _ready():
	enemy_manager = get_tree().get_first_node_in_group("Enemy_Manager")


func die():
	if enemy_manager:
		enemy_manager.enemy_killed(self)

func _physics_process(_delta):
	move_and_slide()

func get_direction():
	return velocity

func _on_death_died():
	die()
	pass # Replace with function body.

func reset():
	velocity = Vector2.ZERO
	health_manager.health = health_manager.max_health
	state_machine.change_state(state_machine.default_state)
