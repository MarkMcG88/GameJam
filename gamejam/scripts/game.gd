extends Node2D

@onready var player = get_node("Player")
@onready var hud = get_node("Hud")
@onready var control = hud.get_node("Control")
@onready var bones_collected = control.get_node("BonesCollected")
@onready var bones_left = control.get_node("BonesLeftLabel")

func _ready():	
	player.bones_updated.connect(bones_collected.update_bones_list)
	player.bones_updated.connect(bones_left.update_bones_list)
