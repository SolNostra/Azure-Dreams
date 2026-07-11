extends Node

signal night_started()
signal night_ended()

var can_end_night := false
func _ready() -> void:
	ObjectiveManager.all_objectives_completed.connect(_on_objectives_completed)

func _on_objectives_completed() -> void:
	can_end_night = true

func start_night() -> void:
	night_started.emit()
	
func end_night() -> void:
	night_ended.emit()
