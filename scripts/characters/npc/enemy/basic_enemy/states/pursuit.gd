extends Node


# Exports
@export var character: CharacterBody2D
@export var lock_direction = false
@export var movement_details =  {}
@export var animation_name = "pursuit"
@export var mobility_manager: Node2D
@export var attack_distance = 300

# Other variables
@onready var sm = get_parent()
var is_active = false
var callbacks = {}
var direction_dependent = true
var timer:Timer
var target: Node2D
# Functions
func _ready():
	make_timer()


func make_timer():
	timer = Timer.new()
	timer.one_shot = false
	timer.autostart = true
	add_child(timer)
	#timer.timeout.connect(update_position)
	timer.start()
	

# Required state functions
func update_state(delta):
	var target_vector =  character.navigator.get_next_step() - character.global_position 
	if target_vector == null:
		return
	if (target_vector.length() < 10):
		target_vector = Vector2.ZERO
	else:
		target_vector = target_vector.normalized()
	mobility_manager.input_direction = target_vector

	if (character.position - character.target_tracker.get_target().position).length() < attack_distance:
		sm.change_state("Charge")
	
	
func enter_state():
	# turn on hitbox
	character.navigator.turn_on()
	pass
	
func exit_state():
	# turn off hitbox
	character.navigator.turn_off()
	
	
	mobility_manager.input_direction = Vector2.ZERO
	pass


func _on_target_tracker_new_target(target):
	if !target:
		sm.change_state("Idle")
