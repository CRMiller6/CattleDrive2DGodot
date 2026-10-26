extends Node2D

@export var is_daytime : bool = true
@export var is_nighttime : bool = false

@export var hours_per_day: int = 12
@export var hours_per_night: int = 12

@export var seconds_per_hour: float = 10

@export var day_color: Color = Color(1,1,1)
@export var night_color: Color = Color(0.1,0.1,0.3)

@export var current_hour: int = 0
@onready var timer: Timer = $CycleTimer

func _ready() -> void:
	timer.wait_time = seconds_per_hour
	timer.autostart = true
	
func _process(delta: float) -> void:
	pass
