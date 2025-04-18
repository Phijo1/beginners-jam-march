extends AnimatableBody2D

var direction: Vector2
var speed = 5
var velocity: Vector2
var rebounding = false
@onready var timer = %TimeoutTimer

func _ready() -> void:
	velocity = direction * speed

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity)
	if collision != null:
		# There has to be a better way of doing this
		if collision.get_collider().has_method("shield_area"):
			print("woo")
		else:
			queue_free()

func rebound(angle: float):
	speed = 10
	timer.wait_time = 10.0
	timer.start()
	rebounding = true
	angle = deg_to_rad(rad_to_deg(angle) - 90)
	direction = Vector2.from_angle(angle)
	velocity = direction * speed

func rebound_other():
	#self.collision_mask = 1
	#self.collision_layer = 1
	speed = 10
	timer.wait_time = 10.0
	timer.start()
	rebounding = true
	var mouse_pos = self.get_global_mouse_position()
	var angle_to = rad_to_deg(mouse_pos.angle_to_point(global_position)) - 180
	direction = Vector2.from_angle(deg_to_rad(angle_to))
	velocity = direction * speed

func _on_timer_timeout() -> void:
	queue_free()
