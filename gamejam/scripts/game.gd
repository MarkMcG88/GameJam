extends Node2D

@onready var player = get_node("Player")  # Path to Player node
@onready var bones_collected = get_node("BonesCollected")  # Get BonesCollected node from Camera2D

func _ready():	
	player.bones_updated.connect(bones_collected.update_bones_list)
