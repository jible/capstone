class_name HurtBox
extends Area2D

signal received_damage(damage:int)

@onready var character: CharacterBody2D = get_parent()
@export var timer: Timer
@export var invincibility_time: float = .5
@export var detectable: bool = false

@export var collisionshape :CollisionShape2D

var overlapping_areas = []
var latest_hit_direction = Vector2.ZERO

func turn_on():
	collisionshape.debug_color = Color(84, 73, 75,.5)
	for area in get_overlapping_areas():
		if area is HitBox && area.detecting:
			area.hit(self)
			break
	detectable = true

func turn_off():
	collisionshape.debug_color = Color(241, 247, 237, 0)
	
	detectable = false

func _on_area_entered(area):
	if area is HitBox:
		overlapping_areas.append(area)
	pass # Replace with function body.

func _on_area_exited(area):
	overlapping_areas.erase(area)
	pass # Replace with function body.

func hit_by(hitbox :HitBox):
	latest_hit_direction = (character.position - hitbox.global_position ).normalized()
	received_damage.emit(hitbox.damage)
	
func turn_off_for_sec(time = invincibility_time):
	turn_off()
	
	timer.wait_time = time
	timer.one_shot = true
	timer.start()
	await(timer.timeout)
	
	turn_on()
