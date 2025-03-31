extends Node2D

func update_bones_list(bones: Array):

	for child in get_children():
		child.queue_free()
		
	var x_offset = 0 
	
	print("update bones")
	
	for bone in bones:
		var sprite = TextureRect.new()
		sprite.texture = bone.sprite
		sprite.custom_minimum_size = Vector2(16, 16) 
		sprite.scale = Vector2(0.4, 0.4)
		sprite.position = Vector2(x_offset, 0) 
		x_offset -= 80 
		add_child(sprite)
		
		print(get_children())
		
	if bones.size() == 5:
		$AudioStreamPlayer2D.play()
