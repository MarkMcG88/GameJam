extends Node2D

@export var fall_speed: float = 320
@export var is_falling: bool = false

@onready var killbox = $Killbox
@onready var trigger_area = $TriggerArea
@onready var timer = $SelfDestructTimer

var checkpoint_manager
var player
var startPosition

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	checkpoint_manager = get_parent().get_node("CheckpointManager")
	player = get_parent().get_node("Player")
	startPosition = position
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	if is_falling:
		global_position.y += fall_speed * delta
		fall_speed += 10
	
func _on_trigger_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		is_falling = true
		timer.start()


func _on_killbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		timer.stop()
		position = startPosition
		is_falling = false
		fall_speed = 320
		AudioController.play_falling()
		killPlayer()
		
func killPlayer():
	player.position = checkpoint_manager.last_location


func _on_self_destruct_timer_timeout() -> void:
	queue_free()
