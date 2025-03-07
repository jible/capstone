@tool

extends Control

@export var controls: Array[String]:
	set(new_control):
		controls = new_control
		create_control()
		
@export var container: VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func create_control():
	var control_nodes = get_tree().get_nodes_in_group("controls")
	print(control_nodes)
	for control in controls:
		if control_exists(control):
			if control_node_exists(control):
				printerr("Input %s node already created (Duplicate input)" % control)
			else:
				create_control_node(control)
		else:
			printerr("Input name %s not found in InputMap, please bind it" % control)

func create_control_node(control: String) -> void:
	var control_label = Label.new()
	container.add_child(control_label)
	control_label.owner = get_tree().edited_scene_root
	control_label.name = control
	control_label.text = control
	control_label.add_to_group("controls")

func control_node_exists(control: String) -> bool:
	var control_nodes = get_tree().get_nodes_in_group("controls")
	for node in control_nodes:
		if node.name == control:
			return true
	return false
	
func control_exists(control: String) -> bool:
	return ProjectSettings.has_setting("input/%s" % control)
