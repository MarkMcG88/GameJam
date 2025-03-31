extends Node2D

func _process(delta):
	var viewport_size = get_viewport_rect().size
	position = Vector2(viewport_size.x - 120, 20)  # Adjust as needed

func update_bones_list(bones: Array):
	# Clear existing UI
	for child in get_children():
		child.queue_free()
		
	var x_offset = 0  # Start position for first bone
	
	print("update bones")
	
	# Display each collected bone
	for bone in bones:
		var sprite = TextureRect.new()
		sprite.texture = bone.sprite
		sprite.custom_minimum_size = Vector2(16, 16)  # Adjust size as needed
		sprite.scale = Vector2(0.25, 0.25)
		sprite.position = Vector2(x_offset, 0)  # Move sprite to the right
		x_offset += 40  # Increase x_offset for the next sprite (spacing between them)
		add_child(sprite)
