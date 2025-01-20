class_name HurtBox
extends Area2D

signal received_damage(damage:int)

@export var health: Health
@export var collision: CollisionShape2D
@export var timer: Timer
@export var invincibility_time: float = .5
@export var detectable: bool = false

var overlapping_areas = []

func turn_on():
	for area in get_overlapping_areas():
		if area is HitBox && area.detecting:
			area.hit(self)
			break
	detectable = true


func turn_off():
	detectable = false


func _on_area_entered(area):
	if area is HitBox:
		overlapping_areas.append(area)
	pass # Replace with function body.


func _on_area_exited(area):
	overlapping_areas.erase(area)
	pass # Replace with function body.


func hit_by(hitbox :HitBox):
	print("i got hit")
	received_damage.emit(hitbox.damage)
	
func turn_off_for_sec(time = invincibility_time):
	turn_off()
	
	timer.wait_time = time
	timer.one_shot = true
	timer.start()
	await(timer.timeout)
	
	turn_on()
