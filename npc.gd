extends CharacterBody3D

var rng = RandomNumberGenerator.new()
var nextPos = Vector3(0,0,0)
var weight: float = 0.0
var debounce = true
var t = 0.0
@onready var goto = $goto

func nextRan():
	nextPos = nextPos + Vector3(rng.randi_range(-5,5),rng.randi_range(-5,5),rng.randi_range(-5,5))
	print(nextPos)
	if nextPos.x > 12:
		nextPos.x = 12
	elif nextPos.x < -12:
		nextPos.x = -12
	if nextPos.y > 12:
		nextPos.y = 12
	elif nextPos.y < -12:
		nextPos.y = -12
	if nextPos.z > 12:
		nextPos.z = 12
	elif nextPos.z < -12:
		nextPos.z = -12
	
	goto.position = nextPos

func _process(delta):
	if debounce:
		debounce = false
		nextRan()
	elif not debounce:
		t += delta / 5
		self.transform = self.transform.interpolate_with(goto.transform, t)
		if position == nextPos:
			t = 0.0
			debounce = true

