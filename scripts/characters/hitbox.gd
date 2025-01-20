class_name HitBox
extends Area2D
#src: https://www.youtube.com/watch?v=rU-JfP2nOpo&ab_channel=blazeDev

@export var damage: int = 1
@export var collision: CollisionShape2D
@export var detecting:bool = false

var overlapping_areas = []

func turn_on():
	for area in overlapping_areas:
		if area is HurtBox && area.detectable:
			hit(area)
	detecting = true
	pass


func turn_off():
	detecting = false


func _on_area_entered(area):
	overlapping_areas.append(area)
	if detecting && area.detectable:
		hit(area)

func _on_area_exited(area):
	if !detecting:
		overlapping_areas.erase(area)


func set_damage(value: int):
	damage = value
	
	
func get_damage():
	return damage


func hit( hurtbox: HurtBox):
	hurtbox.hit_by(self)
	print ("smacked them1")
	pass
