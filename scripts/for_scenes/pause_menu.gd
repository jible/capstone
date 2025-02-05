extends Control

@onready var option_menu: Control = $"OptionMenu"
@onready var pause_ui: PanelContainer = $"PauseUI"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#TODO
	#pause the game if esc is pressed
	#if Input.is_action_just_pressed("esc"):
		#print("esc press")
		#pause_ui	.visible = true
		#get_tree().paused = !get_tree().paused
	pass

func _on_options_toggle_pressed() -> void:
	#toggle options menu
	option_menu.visible = true
	pause_ui.visible = false
	#TODO
	#Add universal esc button to return from options

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
