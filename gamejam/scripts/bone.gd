extends Area2D

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	
func _on_body_entered(body: Node2D) -> void:
	print("body pos - %s" % body.position)
	print("coli pos - %s" % $CollisionShape2D.position)
	var bone_name = get_meta("name")  # This should retrieve the string set in the Inspector
	var bone_sprite = get_meta("texture")  # This should retrieve the texture set in the Inspector
	print("bone collected - " + bone_name)
	$AudioStreamPlayer2D.play()
	$AudioStreamPlayer2D.connect("finished", Callable(self, "queue_free"))
	if body.is_in_group("player"):
		body.collect_bone(bone_name, bone_sprite)
	if $Sprite2D != null:
		$Sprite2D.queue_free()
	if $CollisionShape2D != null:
		$CollisionShape2D.queue_free()
	#
#func testprint():
	#var bone_name = get_meta("name")  # This should retrieve the string set in the Inspector
	#var bone_sprite = get_meta("texture")  # This should retrieve the texture set in the Inspector
	#
	#if bone_name:
		#print("Bone name: ", bone_name)
	#else:
		#print("Bone name is null")
	#
	#if bone_sprite:
		#print("Bone texture: ", bone_sprite)
	#else:
		#print("Bone texture is null")

#
#func _on_area_entered(area: Area2D) -> void:
	#var bone_name = get_meta("name")  # This should retrieve the string set in the Inspector
	#var bone_sprite = get_meta("texture")  # This should retrieve the texture set in the Inspector
	#print("bone collected - " + bone_name)
	#$AudioStreamPlayer2D.play()
	#$AudioStreamPlayer2D.connect("finished", Callable(self, "queue_free"))
	#if area.is_in_group("player"):
		#area.collect_bone(bone_name, bone_sprite)
	#if $Sprite2D != null:
		#$Sprite2D.queue_free()
