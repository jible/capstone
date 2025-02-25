extends SMState

# Exports
@export var character: CharacterBody2D
@export var lock_direction = false
@export var movement_details =  {}
@export var animation_name = "idle"
@export var min_patrol_distance: int = 1000
@export var max_patrol_distance: int = 5000
# On readys
@onready var sm = get_parent()
var direction_dependent = true
var callbacks = {}
var is_active = false
var walking = false
var current_destination = null
var required_distance_from_target = 10
var timer
var new_route_frequency = 5
# Main Functions
func _ready():
	make_timer()


func make_timer():
	timer = Timer.new()
	timer.wait_time = new_route_frequency
	timer.one_shot = false
	timer.autostart = true
	timer.timeout.connect(timer_done)
	add_child(timer)
	timer.start()

func timer_done():
	if is_active:
		get_new_destination()

func update_state(delta):
	if (!walking):
		get_new_destination()
	var target_vector = character.navigator.get_next_step() - character.global_position
	target_vector = target_vector.normalized()
	character.mobility_manager.input_direction = target_vector
func enter_state():
	character.navigator.turn_off()
	pass
func exit_state():
	pass


func get_new_destination():
	var x = randf_range ( min_patrol_distance , max_patrol_distance ) * (1 if (randi() % 2 == 0) else -1)
	var y = randf_range ( min_patrol_distance , max_patrol_distance ) * (1 if (randi() % 2 == 0) else -1)
	
	current_destination = Vector2(x,y) + character.global_position
	character.navigator.update_target_pos(current_destination)
	walking = true


func _on_target_tracker_new_target(new_target):
	if new_target:
		sm.change_state("Pursuit")
