class_name HurtBox
extends Area2D

signal received_damage(damage:int)

@export var collision: CollisionShape2D
@export var health: Health


func turn_on():
	collision.disabled = false
	
func turn_off():
	collision.disabled = true

func _ready():
	pass

func _on_area_entered(hitbox: HitBox):
	if hitbox != null:
		received_damage.emit(hitbox.damage)
		print("Taking Damage!! I am: ", self.name)
