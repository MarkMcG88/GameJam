extends Node2D

@onready var player = get_node("Player")
@onready var camera = player.get_node("Camera2D")
@onready var bones_collected = camera.get_node("BonesCollected")  

func _ready():	
	player.bones_updated.connect(bones_collected.update_bones_list)
