extends Node

const LOADING_SCREEN = preload("uid://beae6us568nfl")

signal scene_loaded

func load_scene(scene: String) -> void:
	var old_scene = get_tree().current_scene
	if old_scene:
		old_scene.queue_free()
	
	var loading = LOADING_SCREEN.instantiate()
	loading.next_scene_path = scene
	get_tree().root.add_child(loading)
	
	await loading.scene_loaded
	scene_loaded.emit()
