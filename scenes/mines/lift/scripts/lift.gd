extends Node3D

func _ready() -> void:
	NightManager.night_ended.connect(_on_night_ended)

func _on_night_ended() -> void:
	get_tree().change_scene_to_file("res://menus/nightend/night_end_menu.tscn")
