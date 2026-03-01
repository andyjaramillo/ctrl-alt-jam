extends AudioStreamPlayer



func _on_finished() -> void:
	$Murmur.play()


func _on_murmur_finished() -> void:
	$Murmur.play()
