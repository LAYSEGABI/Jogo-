extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -500.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	velocity.y += gravity * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		$SoundJump.play()
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED
	if direction > 0:
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play()
	elif direction < 0:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	move_and_slide()
