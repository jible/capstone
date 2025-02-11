extends Control

@onready var pause_menu: Control = $"PauseMenu"
@onready var option_menu: Control = $"OptionMenu"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		if !pause_menu.visible && option_menu.visible:
			option_menu.hide()
			pause_menu.show()
		else:
			visible = !visible
			get_tree().paused = !get_tree().paused

func _on_options_toggle_pressed() -> void:
	pause_menu.hide()
	option_menu.show()

func _on_resume_toggle_pressed() -> void:
	#resume game, hide pause menu
	get_tree().paused = false
	self.hide()

func _on_quit_toggle_pressed() -> void:
	# notification that is passed to all nodes before quit is called
	# use for saving features or confirmation msgs
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	# close the application/scenetree
	get_tree().quit()
