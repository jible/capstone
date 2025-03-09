#based off of Easy Input Settings Menu by DashNothing
#https://www.youtube.com/watch?v=ZDPM45cHHlI
extends Control
class_name BindControl

@export var control: String

@onready var binding_button: Button = %BindingButton
@onready var control_label: Label = %ControlLabel

var is_remapping: bool = false

func _ready() -> void:
	update_texts(control, InputMap.action_get_events(control)[0])

func _on_binding_button_pressed() -> void:
	is_remapping = true
	binding_button.text = "Press button to bind"

func _input(event: InputEvent) -> void:
	if is_remapping:
		if (
			event is InputEventKey || 
			(event is InputEventMouseButton && event.is_pressed()) ||
			event is InputEventJoypadButton || 
			event is InputEventJoypadMotion
		):
			#bind to input map
			InputMap.action_erase_events(control)
			InputMap.action_add_event(control, event)
			update_texts(control, event)
			is_remapping = false
			
			accept_event()
			
func set_control(control: String):
	self.control = control
	update_texts(control, InputMap.action_get_events(control)[0])

func update_texts(control: String, event: InputEvent) -> void:
	binding_button.text = event.as_text().trim_suffix(" (Physical)")
	##TODO localize control using tr(control)
	control_label.text = control.capitalize() + ": "
