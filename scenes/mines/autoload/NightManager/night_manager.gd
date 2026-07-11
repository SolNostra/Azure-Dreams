extends Node

signal night_started()
signal night_ended()

var night_end_delay := 5.0
var can_end_night := false

func _ready() -> void:
	ObjectiveManager.all_objectives_completed.connect(_on_objectives_completed)

func _on_objectives_completed() -> void:
	can_end_night = true

func start_night() -> void:
	night_started.emit()
	get_tree().change_scene_to_file("res://scenes/mines/cave.tscn")
	
func end_night() -> void:
	night_ended.emit()
