extends Node2D

@onready var player = get_node("Player")  # Path to Player node
@onready var canvas_layer = get_node("CanvasLayer")  # Get Camera2D node from Player
@onready var bone_control = canvas_layer.get_node("BoneControl")  # Get Camera2D node from Player
@onready var bones_collected = bone_control.get_node("BonesCollected")  # Get BonesCollected node from Camera2D

func _ready():	
	player.bones_updated.connect(bones_collected.update_bones_list)
