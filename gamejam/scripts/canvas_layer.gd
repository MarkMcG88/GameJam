extends CanvasLayer

func _process(delta):
	var viewport_size = get_viewport_rect().size
	position = Vector2(viewport_size.x - 120, 20)  # Adjust as needed
