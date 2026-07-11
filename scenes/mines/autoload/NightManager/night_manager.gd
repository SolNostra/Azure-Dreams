extends Node

signal night_started()
signal night_ended()

var night_end_delay := 5.0
var can_end_night := false
var night_ongoing := false

func _ready() -> void:
	ObjectiveManager.all_objectives_completed.connect(_on_objectives_completed)

func _on_objectives_completed() -> void:
	can_end_night = true

func start_night() -> void:
	LoadingManager.load_scene("res://scenes/mines/cave.tscn")
	await LoadingManager.scene_loaded
	night_started.emit()
	night_ongoing = true
	
func end_night() -> void:
	night_ended.emit()
	night_ongoing = false
