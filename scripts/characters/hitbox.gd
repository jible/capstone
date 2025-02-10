class_name HitBox
extends Area2D
#src: https://www.youtube.com/watch?v=rU-JfP2nOpo&ab_channel=blazeDev

@export var damage: int = 1
@export var collision: CollisionShape2D
@export var detecting:bool = false
@export var distance_from_parent: int = 100
@export var knockback = 50

var overlapping_areas = []
var successful_hit = []

func _ready():
	SignalBus.player_stats_updated.connect(set_upgrade_damage)

func turn_on():
	for area in overlapping_areas:
		if area is HurtBox && area.detectable && ! (area in successful_hit):
			hit(area)
	detecting = true
	pass


func turn_off():
	successful_hit = []
	detecting = false


func _on_area_entered(area):
	overlapping_areas.append(area)
	if detecting && area.detectable:
		hit(area)

func _on_area_exited(area):
	overlapping_areas.erase(area)

func _on_direction_manager_direction_changed(direction: Vector2):
	move_direction(direction)



func set_damage(value: int):
	damage = value
	
func set_upgrade_damage():
	damage+= UpgradeManager.get_stat("dmg")
	
func get_damage():
	return damage

func hit( hurtbox: HurtBox):
	successful_hit.append(hurtbox)
	hurtbox.hit_by(self)
	pass


func move_direction(direction):
	move_to(direction * distance_from_parent)

func move_to(target_position):
	position = target_position
