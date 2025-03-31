extends Area2D

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	
func _on_body_entered(body: Node2D) -> void:
	var bone_name = get_meta("name")
	var bone_sprite = get_meta("texture")
	AudioController.play_pickup()
	if body.is_in_group("player"):
		body.collect_bone(bone_name, bone_sprite)
	if $Sprite2D != null:
		$Sprite2D.queue_free()
	if $CollisionShape2D != null:
		$CollisionShape2D.queue_free()
