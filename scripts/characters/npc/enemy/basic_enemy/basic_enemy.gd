extends CharacterBody2D

# All children references
@export var mobility_manager: MobilityManager
@export var state_machine: StateMachine
@export var hitbox: HitBox
@export var hurtbox: HurtBox
@export var sprite_manager: SpriteManager
@export var health_manager: Health

var type = "basic_enemy"

@export var drop : PackedScene
var enemy_manager:Node = null

func _ready():
	enemy_manager = get_tree().get_first_node_in_group("Enemy_Manager")

func death_drop():
	if drop:
		var instance = drop.instantiate()
		instance.position = position
		get_tree().current_scene.add_child(instance)

func die():
	death_drop()
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
