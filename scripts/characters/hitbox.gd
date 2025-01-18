class_name HitBox
extends Area2D
#src: https://www.youtube.com/watch?v=rU-JfP2nOpo&ab_channel=blazeDev

@export var collision: CollisionShape2D
@export var damage: int = 1

func turn_on():
	collision.disabled = false
	
func turn_off():
	collision.disabled = true

func set_damage(value: int):
	damage = value
	
func get_damage():
	return damage
