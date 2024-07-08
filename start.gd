extends Button

func _pressed():
	await get_tree().change_scene_to_file("res://main.tscn")
