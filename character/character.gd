extends CharacterBody2D


const SPEED = 600.0
const JUMP_VELOCITY = -800.0
const GRAVITY = 1600

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump()

	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func jump():
	velocity.y = JUMP_VELOCITY


func _on_shield_area_2d_bullet_jump() -> void:
	jump()
