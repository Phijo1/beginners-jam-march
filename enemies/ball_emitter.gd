extends Node2D

var ball_object = preload("res://enemies/ball.tscn")

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	var new_ball = ball_object.instantiate()
	new_ball.direction = Vector2(-1,0)
	add_child(new_ball)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("rebound"):
		if body.rebounding == true:
			queue_free()
