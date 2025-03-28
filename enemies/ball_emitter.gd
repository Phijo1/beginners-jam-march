extends Node2D

var ball_object = preload("res://enemies/ball.tscn")

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	var new_ball = ball_object.instantiate()
	add_child(new_ball)
