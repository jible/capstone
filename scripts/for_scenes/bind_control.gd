#based off of Easy Input Settings Menu by DashNothing
#https://www.youtube.com/watch?v=ZDPM45cHHlI
@tool

extends Control
class_name BindControl

@export var control: String:
	set(new_control):
		control = new_control
		update_mk_rebind_text()
		update_joypad_rebind_text()

@export var control_label: Label
@export var mk_binding_button: Button
@export var joypad_binding_button: Button

const UNBOUND: String =  "UNBOUND"
const BINDING_TEXT: String = "Press button to bind"

var events: Array[InputEvent]
var mk_is_remapping: bool = false
var joypad_is_remapping: bool = false

func _ready() -> void:
	if Input.get_connected_joypads().is_empty():
		#disable joypad rebinding
		joypad_binding_button.disabled = true
	else:
		#disable mk rebinding
		mk_binding_button.disabled = true
	control_label.text = self.control.capitalize() + ": "
	events = InputMap.action_get_events(self.control)
	update_mk_rebind_text()
	update_joypad_rebind_text()
	
func _on_mk_rebind_button_pressed() -> void:
	mk_is_remapping = true
	mk_binding_button.text = BINDING_TEXT
	
func _on_joypad_rebind_button_pressed() -> void:
	joypad_is_remapping = true
	joypad_binding_button.text = BINDING_TEXT

func _input(event: InputEvent) -> void:
	if mk_is_remapping:
		if is_valid_mk_input(event):
			#remap_action(mk_binding_button, event)
			remap_mk_action(event)
			accept_event()
			mk_is_remapping = false
			
	elif joypad_is_remapping:
		if is_valid_joypad_input(event):
			#remap_action(joypad_binding_button, event)
			remap_joypad_action(event)
			accept_event()
			joypad_is_remapping = false

func is_valid_mk_input(event: InputEvent) -> bool:
	if ( 
		event is InputEventKey || 
		(event is InputEventMouseButton)
		): 
			return true
	return false
	
func is_valid_joypad_input(event: InputEvent) -> bool:
	if ( 
		event is InputEventJoypadButton || 
		## TODO Currently accepts All joypad inputs, ideally we remove this
		## inputs per value on the stick doesn't make much sense
		(event is InputEventJoypadMotion )
		# this line limits it to just the trigger and buttons, but we need to add options
		# for swapping stick layout, x/y reversing etc.
		#&& ( event.axis == JOY_AXIS_TRIGGER_LEFT || event.axis == JOY_AXIS_TRIGGER_RIGHT ) 
		): 
			return true
	return false
	
func remap_mk_action(new_event: InputEvent) -> void:
	for current_mapping in events:
		if is_valid_mk_input(current_mapping):
			InputMap.action_erase_event(self.control, current_mapping)
	InputMap.action_add_event(self.control, new_event)
	update_mk_rebind_text()
	
func remap_joypad_action(new_event: InputEvent) -> void:
	for current_mapping in events:
		if is_valid_joypad_input(current_mapping):
			InputMap.action_erase_event(self.control, current_mapping)
	InputMap.action_add_event(self.control, new_event)
	update_joypad_rebind_text()
		
func update_mk_rebind_text() -> void:
	for event in events:
		if is_valid_mk_input(event):
			mk_binding_button.text = event.as_text().trim_suffix(" (Physical)")
			#currently just grab the first valid event, then exit
			return

func update_joypad_rebind_text() -> void:
	for event in events:
		if is_valid_joypad_input(event):
			joypad_binding_button.text = event.as_text()
			#currently just grab the first valid event, then exit
			return

## TODO: formatting inputs nicely from InputEvent -> String text
func get_mk_events():
	pass
	
func get_joypad_events():
	pass
