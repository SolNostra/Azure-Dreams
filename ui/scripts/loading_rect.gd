extends ColorRect
class_name LoadingScreen

@onready var progress_bar: ProgressBar = %ProgressBar
@export var next_scene_path: String = "res://scenes/hub/hub_area.tscn"
var progress : Array[float] = []

signal scene_loaded

func _enter_tree() -> void:
	ResourceLoader.load_threaded_request(next_scene_path)

func _process(_delta: float) -> void:
	var status = ResourceLoader.load_threaded_get_status(next_scene_path, progress)
	
	match status:
		ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			var pct = progress[0] * 100
			progress_bar.value = pct
		ResourceLoader.THREAD_LOAD_LOADED:
			var scene = ResourceLoader.load_threaded_get(next_scene_path)
			get_tree().change_scene_to_packed(scene)
			scene_loaded.emit()
			queue_free()
		ResourceLoader.THREAD_LOAD_FAILED, ResourceLoader.THREAD_LOAD_INVALID_RESOURCE:
			push_error("Failed to load scene: " + next_scene_path)
			queue_free()
