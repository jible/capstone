extends CharacterBody2D


@export var drop : PackedScene


var enemy_manager:Node = null

func _init(manager):
	enemy_manager = manager


func _ready():
	if enemy_manager == null:
		enemy_manager = get_tree().get_nodes_in_group("Enemy_Manager")[0]


func death_drop():
	if drop:
		var instance = drop.instantiate()
		instance.position = position
		get_tree().current_scene.add_child(instance)

func die():
	death_drop()
	enemy_manager.enemy_killed(self)
	self.queue_free()

func _physics_process(_delta):
	move_and_slide()


func get_direction():
	return velocity


func _on_death_died():
	die()
	pass # Replace with function body.
