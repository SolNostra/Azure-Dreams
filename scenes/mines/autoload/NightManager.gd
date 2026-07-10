extends Node

@onready var night_end_check_timer: Timer = $Timer

signal night_progress_updated(new_value: int)

var current_night_progress := 0
var max_night_progress := 100

# Temporary for testing
func _ready() -> void:
	start_night()

## Helper Functions - Start
func set_progress(value: float) -> void:
	current_night_progress = clampi(value, 0, max_night_progress)
	night_progress_updated.emit(current_night_progress)

func add_progress(value: float) -> void:
	current_night_progress = clampi(current_night_progress + value, 0, max_night_progress)
	night_progress_updated.emit(current_night_progress)
## Helper Functions - Start

## Night Start & End - Start
func _on_timer_timeout() -> void:
	if current_night_progress >= max_night_progress:
		end_night()

func start_night() -> void:
	night_end_check_timer.start()

func end_night() -> void: # Later, require the player to enter the elevator first.
	night_end_check_timer.stop()
	get_tree().change_scene_to_file("res://menus/nightend/night_end_menu.tscn")


## Night Start & End - End
