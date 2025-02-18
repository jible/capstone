extends Node

var player: CharacterBody2D = null

var dir_dict = {
	"north": Vector2i(0,1),
	"south": Vector2i(0,-1),
	"east": Vector2i(1,0),
	"west": Vector2i(-1,0)
}

## Takes a scene path as a parameter and transitions to it.
func change_scene(scene: PackedScene):
	SceneTransition.transition()
	await SceneTransition.on_transition_finished
	get_tree().call_deferred("change_scene_to_file",scene.resource_path)

#notifies systems that game is going to quit, then quits
func quit_game():
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()
