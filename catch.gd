extends Camera3D

var pitch: float = 0.0
var roll: float = 0.0
var yaw: float = 0.0
var coll
var gyroscope: Vector3
var npcScene = preload("res://npc.tscn")
var initial_yaw : float = 0.0
var k : float = 0.98

func _ready():
	await get_tree().process_frame
	var magnet: Vector3 = Input.get_magnetometer()
	initial_yaw = atan2(-magnet.x, magnet.z)

func _physics_process(delta):
	var gravity: Vector3 = Input.get_gravity()
	var magnet: Vector3 = Input.get_magnetometer().rotated(-Vector3.FORWARD, rotation.z).rotated(Vector3.RIGHT, rotation.x)
	var pitch_acc = atan2(gravity.z, -gravity.y)
	var yaw_magnet = atan2(-magnet.x, magnet.z)
	var roll_acc = atan2(-gravity.x, -gravity.y)
	
	gyroscope = Input.get_gyroscope().rotated(-Vector3.FORWARD, roll)
	print(gyroscope)
	gravity = gravity.rotated(-Vector3.FORWARD, rotation.z)
	pitch = lerp_angle(pitch_acc, pitch + gyroscope.x * delta, k)
	# pitch = atan2(gravity.z, -gravity.y)
	yaw = lerp_angle(yaw_magnet, yaw + gyroscope.y * delta, k)
	# yaw = atan2(-magnet.x, magnet.z)
	#roll = lerp_angle(roll_acc, roll + gyroscope.z * delta, k)
	rotation = Vector3(pitch, yaw-initial_yaw, 0.0)
	print(roll_acc)


func _on_catch_pressed():
	if $catchRay.get_collider():
		coll = $catchRay.get_collider()
		coll.queue_free()
	pass # Replace with function body.
