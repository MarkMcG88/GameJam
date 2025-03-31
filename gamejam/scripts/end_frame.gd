extends Panel

func Show() -> void:
	visible = true;
	AudioController.play_victory()


func _on_quit_game_pressed() -> void:
	print(get_tree())
	get_tree().quit()
