#based off of Easy Input Settings Menu by DashNothing
#https://www.youtube.com/watch?v=ZDPM45cHHlI
@tool

extends Control
class_name BindControl

@export var control: String:
	set(new_control):
		control = new_control
		update_binding_text(mk_binding_button)
		update_binding_text(joypad_binding_button)

@export var control_label: Label
@export var mk_binding_button: Button
@export var joypad_binding_button: Button

const UNBOUND: String =  "UNBOUND"
const BINDING_TEXT: String = "Press button to bind"
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
	#update_binding_text(mk_binding_button)
	#update_binding_text(joypad_binding_button)
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
			remap_action(mk_binding_button, event)
			accept_event()
			mk_is_remapping = false
			
	elif joypad_is_remapping:
		if is_valid_joypad_input(event):
			remap_action(joypad_binding_button, event)
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
		(event is InputEventJoypadMotion )
		#&& ( event.axis == JOY_AXIS_TRIGGER_LEFT || event.axis == JOY_AXIS_TRIGGER_RIGHT ) 
		): 
			return true
	return false
	
func remap_action(button: Button, event: InputEvent) -> void:
	InputMap.action_erase_events(self.control)
	InputMap.action_add_event(self.control, event)
	update_binding_text(button, [event])

func update_binding_text(
		button: Button,
		events: Array[InputEvent] = InputMap.action_get_events(control)
	) -> void:
		button.text = ""
		#for event in events:
		if events.is_empty():
			return
		var event = events[0]
		button.text += event.as_text().trim_suffix(" (Physical)") + ", "
		button.text = button.text.trim_suffix(", ")
		
func update_mk_rebind_text() -> void:
	var events = InputMap.action_get_events(control)
	for event in events:
		if is_valid_mk_input(event):
			mk_binding_button.text = event.as_text().trim_suffix(" (Physical)")
			#currently just grab the first valid event, then exit
			return

func update_joypad_rebind_text() -> void:
	var events = InputMap.action_get_events(control)
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
