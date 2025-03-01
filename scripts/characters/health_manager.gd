class_name Health
extends Node

# Exports
@export var starting_health: int = 10
@onready var character: CharacterBody2D = get_parent()
@onready var sm = character.state_machine

# On readys
@onready var health = starting_health
@onready var max_health = starting_health

func _on_hurtbox_received_damage(damage):
	health -= damage
	if (health > 0):
		sm.change_state("Hurt")
	else:
		sm.change_state("Death")
	SignalBus.player_health_updated.emit()
	
func increase_health_from_base(value):
	var tmp = max_health
	max_health = starting_health + value
	if health == tmp:
		health = max_health
	else:
		health = min(health + abs(max_health - tmp), max_health)
	
