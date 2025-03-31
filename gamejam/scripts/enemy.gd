extends Node2D

const v = 20
var path = -1

@onready var ray_cast_right: RayCast2D = $Killzone/CollisionShape2D/RayCastRight
@onready var ray_cast_left: RayCast2D = $Killzone/CollisionShape2D/RayCastLeft
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		path = -1
		animated_sprite_2d.flip_h = false
	if ray_cast_left.is_colliding():
		path = 1
		animated_sprite_2d.flip_h = true
		
	
	position.x += path * v * delta
