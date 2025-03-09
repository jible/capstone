extends Node

# SHADER REFERENCES
const NONE = preload("res://assets/materials/none.tres")
const ACHR = preload("res://assets/materials/achr.tres")
const DUET = preload("res://assets/materials/duet.tres")
const PROT = preload("res://assets/materials/prot.tres")
const TRIT = preload("res://assets/materials/trit.tres")
const CONT = preload("res://assets/materials/cont.tres")
const SHAKE = preload("res://assets/materials/shake.tres")
# Holds references to the Shader Materials
const SHADER_POOL = [NONE,CONT,PROT,ACHR,DUET,TRIT]

# Holds references to the indicies of the shader materials
enum SHADERS{NONE,CONT,PROT,ACHR,DUET,TRIT}

func change_material(material):
	SceneTransition.get_node("Filter").material = SHADER_POOL[material]

# WARNING: Will set the shader back to null after being shaken.
var shake_target : CanvasItem
func shake(target: CanvasItem, duration : float):
	shake_target = target
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = duration
	timer.one_shot = true
	timer.connect("timeout",_on_timer_timeout)
	target.material = SHAKE
	timer.start()

func _on_timer_timeout():
	shake_target.material = null
