extends Node2D

func _process(delta):
	var viewport_size = get_viewport_rect().size
	position = Vector2(viewport_size.x - 120, 20) 

func update_bones_list(bones: Array):

	for child in get_children():
		child.queue_free()
		
	var x_offset = 0 
	
	print("update bones")
	

	for bone in bones:
		var sprite = TextureRect.new()
		sprite.texture = bone.sprite
		sprite.custom_minimum_size = Vector2(16, 16) 
		sprite.scale = Vector2(0.25, 0.25)
		sprite.position = Vector2(x_offset, 0) 
		x_offset += 40 
		add_child(sprite)
		
		print(get_children())
