extends Node2D

@onready var player = get_node("Player")
@onready var hud = get_node("Hud")
@onready var control = hud.get_node("Control")
@onready var bones_collected = control.get_node("BonesCollected")  

func _ready():	
	player.bones_updated.connect(bones_collected.update_bones_list)
