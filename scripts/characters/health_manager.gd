class_name Health
extends Node

# Exports
@export var starting_health: int = 10
@export var sm: Node

# On readys
@onready var health = starting_health


func _on_hurtbox_received_damage(damage):
	health -= damage
	sm.change_state("Hurt")
	pass # Replace with function body.
