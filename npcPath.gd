extends Path3D

var rng = RandomNumberGenerator.new()
var newPos = Vector3i(0,0,0)
var debounce = true

func _process(delta):
	if debounce:
		debounce = false
		newPos = Vector3(rng.randi_range(-12,12),rng.randi_range(-12,12),rng.randi_range(-12,12))
		curve.add_point(newPos)
	pass

func _on_follow_finish():
	debounce = true
