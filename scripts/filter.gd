extends CanvasLayer

@export var shader_pool: Array[Shader]
@export var rect : ColorRect

# None
const NONE = 0
# Achromatopsia
const ACHR = 1
# Deuteranopia
const DUET = 2
# Protanopia
const PROT = 3
# Tritanopia
const TRIT = 4
# High-Contrast
const CONT = 5 

var current_choice = 0
var shader_reference : Shader


func _ready() -> void:
	shader_reference = shader_pool[NONE]

func set_shader(shader_index):
	rect.shader = shader_pool[shader_index]
