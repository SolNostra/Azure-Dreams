extends Control
class_name DebugManager

@onready var foldable = %FoldableContainer

@onready var stat_selection: OptionButton = %StatSelection
@onready var modify_value: LineEdit = %ModifyValue

func _ready() -> void:
	foldable.fold()

func _on_modify_confirm_button_pressed() -> void:
	if stat_selection.selected == 0:
		PlayerManager.player.health_component.increase(modify_value.text.to_int())

## Toggles

const GREEN = Color(0, 255, 0)
const RED = Color(255, 0, 0)

@onready var noclip_status_indicator: ColorRect = %NoclipStatusIndicator
func _on_toggle_noclip_button_pressed() -> void:
	var toggled = PlayerManager.player.movement_controller.toggle_noclip()
	if toggled:
		noclip_status_indicator.color = GREEN
	else:
		noclip_status_indicator.color = RED
	
	
@onready var godmode_status_indicator: ColorRect = %GodmodeStatusIndicator
func _on_toggle_godmode_button_pressed() -> void:
	var toggled = PlayerManager.player.health_component.toggle_godmode()
	if toggled:
		godmode_status_indicator.color = GREEN
	else:
		godmode_status_indicator.color = RED
