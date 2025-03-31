extends CharacterBody2D

signal bones_updated(bones: Array)

const SPEED = 400.0
const JUMP_VELOCITY = -400.0

var collected_bones: Array = []  # Stores {name, sprite} for each bone

var bones_collected = []

var can_move = true

func _physics_process(delta: float) -> void:
		
	if not can_move: 
		return
		
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		AudioController.play_jump()
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
	else:
		if velocity.y < 0 and velocity.y > JUMP_VELOCITY:
			$AnimatedSprite2D.play("jumping")
		elif velocity.y > 0:
			$AnimatedSprite2D.play("falling")

	# Flip sprite depending on direction
	if direction > 0:
		$AnimatedSprite2D.flip_h = false
	elif direction < 0:
		$AnimatedSprite2D.flip_h = true

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()


func boneCollected(bone_name: String) -> void:
	bones_collected.append(bone_name)
	print(bones_collected)

func collect_bone(bone_name: String, bone_sprite: Texture):
	if not collected_bones.any(func(b): return b.name == bone_name):  # Prevent duplicates
		collected_bones.append({"name": bone_name, "sprite": bone_sprite})
		emit_signal("bones_updated", collected_bones)  # Notify UI to update
