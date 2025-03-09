extends Node

var player: CharacterBody2D = null
var currency_key: String = "money"
var levels = ["Limbo", "Lust"]


var current_level = {
	"level":levels[0],
	"layer" : 0
}

func get_player():
	if player == null || ! is_instance_valid(player):
		player = get_tree().get_first_node_in_group("Player")
	return player

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
	SaveHandler.save_game()
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()

# TODO make a dedicate script or re-write the save mechanic to allow a different function name
func save():
	return {
		'locale' : TranslationServer.get_locale()
	}
	
func load_save(data):
	TranslationServer.set_locale(data.get( 'locale' , 'en') )
