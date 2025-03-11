@tool

extends Control

var things = InputMap.get_actions()

var controls: Array[StringName]:
	set(new_control):
		controls = new_control
		if Engine.is_editor_hint():
			create_controls()
		
@export var container: VBoxContainer
@export var bind_control: PackedScene

@onready var grab_focus = %BackButton

func _ready() -> void:
	if Engine.is_editor_hint():
		InputMap.load_from_project_settings()
		controls = InputMap.get_actions()
	grab_focus.grab_focus()
	
func create_controls():
	for control in controls:
		if control_exists(control) && not control_node_exists(control):
			create_control_node(control)

func create_control_node(control: String) -> void:
	var control_node: BindControl = bind_control.instantiate()
	container.add_child(control_node)
	control_node.control = control
	control_node.owner = get_tree().edited_scene_root
	control_node.name = control
	control_node.add_to_group("controls")

func control_node_exists(control: String) -> bool:
	var control_nodes = get_tree().get_nodes_in_group("controls")
	for node in control_nodes:
		if node.name == control:
			printerr("Input %s node already created (Duplicate input)" % control)
			return true
	return false
	
func control_exists(control: String) -> bool:
	if ProjectSettings.has_setting("input/%s" % control):
		if control.find("ui") != 0 && control.find("look") != 0 && control.find("debug") != 0:
			return true
	else:
		printerr("Input name %s not found in InputMap, please bind it" % control)
	return false

func _on_back_button_pressed() -> void:
	self.queue_free()
