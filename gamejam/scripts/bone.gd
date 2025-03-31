extends Area2D

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	
func _on_body_entered(body: Node2D) -> void:
	print("body pos - %s" % body.position)
	print("coli pos - %s" % $CollisionShape2D.position)
	var bone_name = get_meta("name")
	var bone_sprite = get_meta("texture")
	print("bone collected - " + bone_name)
	$AudioStreamPlayer2D.play()
	$AudioStreamPlayer2D.connect("finished", Callable(self, "queue_free"))
	if body.is_in_group("player"):
		body.collect_bone(bone_name, bone_sprite)
	if $Sprite2D != null:
		$Sprite2D.queue_free()
	if $CollisionShape2D != null:
		$CollisionShape2D.queue_free()
