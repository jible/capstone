extends Node

# SHADER REFERENCES
const NONE = preload("res://assets/materials/none.tres")
const ACHR = preload("res://assets/materials/achr.tres")
const DUET = preload("res://assets/materials/duet.tres")
const PROT = preload("res://assets/materials/prot.tres")
const TRIT = preload("res://assets/materials/trit.tres")
const CONT = preload("res://assets/materials/cont.tres")

# Holds references to the Shader Materials
const SHADER_POOL = [NONE,CONT,PROT,ACHR,DUET,TRIT]

# Holds references to the indicies of the shader materials
enum SHADERS{NONE,CONT,PROT,ACHR,DUET,TRIT}

func change_material(material):
	SceneTransition.get_node("Filter").material = SHADER_POOL[material]
