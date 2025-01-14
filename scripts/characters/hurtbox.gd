class_name HurtBox
extends Area2D

signal received_damage(damage:int)

@export var health: Health


func _ready():
	pass

func _on_area_entered(hitbox: HitBox):
	if hitbox != null:
		received_damage.emit(hitbox.damage)
		print("Taking Damage!!")

	
	
