@tool

extends Control

@export var controls: Array[String]:
	set(new_control):
		controls = new_control
		if Engine.is_editor_hint():
			create_control()
		
@export var container: VBoxContainer
@export var bind_control: PackedScene

@onready var grab_focus = $"VBoxContainer/BindControl/HBoxContainer/BindingButton"

func _ready() -> void:
	grab_focus.grab_focus()

func create_control():
	for control in controls:
		if control_exists(control):
			if control_node_exists(control):
				printerr("Input %s node already created (Duplicate input)" % control)
			else:
				create_control_node(control)
		else:
			printerr("Input name %s not found in InputMap, please bind it" % control)

func create_control_node(control: String) -> void:
	var control_node: BindControl = bind_control.instantiate()
	control_node.control = control
	control_node.update_texts(control, InputMap.action_get_events(control)[0])
	container.add_child(control_node)
	control_node.owner = get_tree().edited_scene_root
	control_node.name = control
	control_node.add_to_group("controls")

func control_node_exists(control: String) -> bool:
	var control_nodes = get_tree().get_nodes_in_group("controls")
	for node in control_nodes:
		if node.name == control:
			return true
	return false
	
func control_exists(control: String) -> bool:
	return ProjectSettings.has_setting("input/%s" % control)


func _on_back_button_pressed() -> void:
	self.queue_free()
