#credits to Soma Animus
#https://www.youtube.com/watch?v=Shj_QVwrefY

extends CanvasLayer

signal on_transition_finished

@onready var background: ColorRect = $"ColorRect"
@onready var anim_player: AnimationPlayer = $"AnimationPlayer"

## This sets the high-contrast filter to already be on at start. For debugging purposes only, will layer other filters on top.
@export var rozy_mode : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if rozy_mode:
		ShaderManager.change_material(ShaderManager.SHADERS.CONT)
	background.visible = false
	anim_player.animation_finished.connect(_on_anim_finished)

func transition():
	background.visible = true
	anim_player.play("fade_in")

func _on_anim_finished(anim_key):
	if anim_key == "fade_in":
		on_transition_finished.emit()
		anim_player.play("fade_out")
	elif anim_key == "fade_out":
		background.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
