class_name HitBox
extends Area2D
#src: https://www.youtube.com/watch?v=rU-JfP2nOpo&ab_channel=blazeDev
@export var character:CharacterBody2D
@export var damage: int = 1
@export var collision: CollisionShape2D
@export var detecting:bool = false
@export var distance_from_parent: int = 130
@export var knockback = 50
@export var collisionshape :CollisionShape2D
@export var on_swivel = false
var overlapping_areas = []
var successful_hit = []

func turn_on():
	collisionshape.debug_color = Color (179, 57, 81, .5)
	for area in overlapping_areas:
		if area is HurtBox && area.detectable && ! (area in successful_hit):
			hit(area)
	detecting = true
	pass

func turn_off():
	collisionshape.debug_color = Color (145, 199, 177,0)
	successful_hit = []
	detecting = false

func _on_area_entered(area):
	overlapping_areas.append(area)
	if detecting && area.detectable:
		hit(area)

func _on_area_exited(area):
	overlapping_areas.erase(area)


func _on_direction_manager_direction_changed(direction: Vector2):
	if !on_swivel :
		move_direction(direction)

#TODO node sure if this if statement is a good thing to put in a physics process call. It looked a little messy
# when I tried adding a signal listener to get the current state on state change and hard set a bool.
func _physics_process(delta):
	if on_swivel && ! character.state_machine.get_current_state_node().lock_direction:
		move_to (character.get_direction().normalized() * distance_from_parent ) 

func set_damage(value: int):
	damage = value
	
func increase_damage(value: int):
	damage += value
	
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
