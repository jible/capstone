extends Control

## The scene to transition to when the player hits "Start"
## TODO
## remap path when we do the file heirarchy refactor
@export var path_to_scene : String = "res://scenes/prefabs/scene_config_package.tscn"
@export var options_menu: PackedScene

@onready var play_button: Button = $"PlayButton"
@export var high_score_label : Label 
func _ready() -> void:
	SignalBus.options_closed.connect(_on_options_hidden)
	SignalBus.update_HUD.connect(update_high_score_label)
	update_high_score_label()
	play_button.grab_focus()

func _on_play_button_button_up() -> void:
	## Switch to the next scene without interuppting a process
	Globals.change_scene(load (path_to_scene) )

func _on_tutorial_button_button_up():
	Globals.change_scene(load ("res://scenes/tutorial.tscn") )

func _on_options_button_pressed() -> void:
	self.hide()
	var options_instance = options_menu.instantiate()
	get_parent().add_child(options_instance)

func _on_options_hidden():
	self.show()
	play_button.grab_focus()

func _on_quit_button_pressed() -> void:
	Globals.quit_game()

func update_high_score_label() -> void:
	high_score_label.text = tr("HIGH_SCORE") + "%d" % ScoreManager.high_score
