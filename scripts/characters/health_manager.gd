class_name Health
extends Node

# Exports
@export var starting_health: int = 10
@export var sm: Node

# On readys
@onready var health = starting_health
@onready var max_health = starting_health

func _on_hurtbox_received_damage(damage):
	health -= damage
	if health >0:
		sm.change_state("Hurt")
	else:
		sm.change_state("Death")
	pass # Replace with function body.
	
func increase_starting_health(increase):
	max_health = starting_health + increase
