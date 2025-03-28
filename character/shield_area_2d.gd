extends Area2D

var mouse_pos: Vector2
var angle_to: float

@onready var shield_pivot := %Shield_Pivot

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	mouse_pos = shield_pivot.get_global_mouse_position()
	angle_to = rad_to_deg(mouse_pos.angle_to_point(shield_pivot.global_position)) - 90
	shield_pivot.rotation = deg_to_rad(angle_to)


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("rebound_other"):
		#This is to avoid weird aiming when the mouse is too close to the shield and the bullet gets wonkily reflected
		if mouse_pos.distance_to(shield_pivot.global_position) < 130:
			body.rebound(shield_pivot.rotation)
		else:
			body.rebound_other()


func shield_area():
	pass
