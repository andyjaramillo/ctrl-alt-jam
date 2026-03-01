extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	



func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://end_screen.tscn")


func _on_area_entered(area: Area2D) -> void:
	print("smsad")
	$"../MainBGM".volume_db = -25
	$Timer.start()


func _on_body_entered(body: Node2D) -> void:
	print("123123")
	$"../MainBGM".volume_db = -50
	$Timer.start()
