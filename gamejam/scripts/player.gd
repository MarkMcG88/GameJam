extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -500.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# move_left and move_right are defined in Project settings > Input Map
	var direction := Input.get_axis("move_left", "move_right")

	if is_on_floor():
		# Changing animations
		if direction == 0:
			$AnimatedSprite2D.play("idle")
		elif direction != 0:
			$AnimatedSprite2D.play("walking")
			
		# Flip sprite depending on direction
		if direction > 0:
			$AnimatedSprite2D.flip_h = false
		elif direction < 0:
			$AnimatedSprite2D.flip_h = true
		
		# Movement	
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			
	else:
		$AnimatedSprite2D.play("jumping")
		
	move_and_slide()
