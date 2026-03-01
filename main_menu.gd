extends Control

func _on_start_btn_pressed() -> void:
	$Dark.visible = true
	$AudioStreamPlayer/BreakOutSFX.play()

func _on_quit_btn_pressed() -> void:
	get_tree().quit()


func _on_audio_stream_player_2_finished() -> void:
	get_tree().change_scene_to_file("res://world.tscn")
	



func _on_cred_btn_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$CredPanel.visible = true
	else:
		$CredPanel.visible = false
