extends Node
class_name ShowOnNightStart

@onready var margin_container: MarginContainer = $"../HUD/MarginContainer"
@onready var bottom_border: PanelContainer = $"../HUD/BottomBorder"
@onready var top_border: PanelContainer = $"../HUD/TopBorder"

func _ready() -> void:
	if NightManager.night_ongoing:
		show_hud()

func show_hud() -> void:
	margin_container.show()
	bottom_border.show()
	top_border.show()
