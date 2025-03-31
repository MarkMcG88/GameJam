extends Node2D

func update_bones_list(bones: Array):
	# Remove all existing sprites (to avoid duplicates)
	for child in get_children():
		child.queue_free()

	# Position variables
	var start_x = 50  # X position start
	var start_y = 50  # Y position start
	var spacing = 70  # Space between bones

	# Add each collected bone as a Sprite2D
	for i in range(len(bones)):
		var sprite = Sprite2D.new()
		sprite.texture = bones[i].sprite
		sprite.position = Vector2(start_x + (i * spacing), start_y)  # Arrange horizontally
		add_child(sprite)
