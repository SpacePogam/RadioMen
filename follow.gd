extends PathFollow3D

signal finish

func _on_npc_path_curve_changed():
	move_toward(progress_ratio,1,0.02)
	finish.emit()
	pass # Replace with function body.
