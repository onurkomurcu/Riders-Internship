extends Camera3D

# The target object the camera will follow
var target : Node
var follow_speed = 5.0
var min_follow_z = -10.0

func _ready():
	target = get_node("/root/Environment/Player")

func _process(delta):
	if target:
		var new_position = target.global_transform.origin
		new_position.y = global_transform.origin.y 

		if global_transform.origin.z > min_follow_z:
			global_transform.origin = global_transform.origin.lerp(new_position, follow_speed * delta)
			look_at(target.global_transform.origin, Vector3.UP)
