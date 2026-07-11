extends Node3D

@onready var phantom_camera_3d: PhantomCamera3D = $PhantomCamera3D

@export var up_pos := 100.0
@export var down_pos := -25.0
@export var speed := 5.0
@export var arrival_threshold := 0.1

@export var cutscene_duration := 15.0

var target_y: float

func _ready() -> void:
	PlayerManager.player.player_state_component.current_state = PlayerStateComponent.PlayerState.BUSY
	
	target_y = global_position.y
	descend_lift()
	phantom_camera_3d.priority = 10
	await get_tree().create_timer(cutscene_duration).timeout
	phantom_camera_3d.priority = 0
	
	PlayerManager.player.player_state_component.current_state = PlayerStateComponent.PlayerState.IDLE
	

func ascend_lift() -> void:
	target_y = up_pos

func descend_lift() -> void:
	target_y = down_pos

func _physics_process(delta: float) -> void:
	if abs(global_position.y - target_y) < arrival_threshold:
		global_position.y = target_y
		return
	
	var new_y = move_toward(global_position.y, target_y, speed * delta)
	global_position = Vector3(global_position.x, new_y, global_position.z)
