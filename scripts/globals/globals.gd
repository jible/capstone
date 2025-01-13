extends Node

## Takes a scene path as a parameter and transitions to it.
func change_scene(scene: PackedScene):
	get_tree().call_deferred("change_scene_to_file",scene.resource_path)
