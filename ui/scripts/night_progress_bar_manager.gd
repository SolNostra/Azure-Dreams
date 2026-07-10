extends Node
class_name NightProgressBarManager

@onready var night_progress_bar: ProgressBar = %NightProgress

func _ready() -> void:
	NightManager.night_progress_updated.connect(_on_night_progress_updated)
	
func _on_night_progress_updated(value: float) -> void:
	night_progress_bar.value = value
