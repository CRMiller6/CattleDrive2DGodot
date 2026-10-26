extends Node

@export var canvas_modulate: CanvasModulate
@export var total_day_length: float = 300.0
@export var day_color: Color = Color(1, 1, 1, 1)
@export var sunset_color: Color = Color(0.9, 0.6, 0.4, 1) 
@export var night_color: Color = Color(0.15, 0.15, 0.35, 1)

var time_elapsed: float = 0.0

func _process(delta: float) -> void:
	time_elapsed += delta
	var day_progress = fmod(time_elapsed, total_day_length) / total_day_length
	
	if day_progress < 0.25:
		canvas_modulate.color = day_color.lerp(sunset_color, day_progress * 4.0)
	elif day_progress < 0.5:
		canvas_modulate.color = sunset_color.lerp(night_color, (day_progress - 0.25) * 4.0)
	elif day_progress < 0.75:
		canvas_modulate.color = night_color.lerp(sunset_color, (day_progress - 0.5) * 4.0)
	else:
		canvas_modulate.color = sunset_color.lerp(day_color, (day_progress - 0.75) * 4.0)
