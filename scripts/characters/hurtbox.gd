class_name HurtBox
extends Area2D

signal received_damage(damage:int)

@export var health: Health
@export var collision: CollisionShape2D

func turn_on():
	collision.disabled = false


func turn_off():
	collision.disabled= true

func _ready():
	pass

func _on_area_entered(hitbox: HitBox):
	print("entereted hurtbox")
	if hitbox != null:
		hitBy(hitbox)
		hitbox.hit(self)

func hitBy(hitbox :HitBox):
	received_damage.emit(hitbox.damage)
