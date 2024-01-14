extends RigidBody3D

var min_follow_z = -10.0

func _process(delta):
	var input := Vector3.ZERO
	input.x = Input.get_axis("move_left", "move_right")
	input.z = Input.get_axis("move_forward", "move_backwards")
	
	var impulse = Vector3(input.x * 0.5 , 0, input.z )
	if global_transform.origin.z > min_follow_z:
		apply_central_impulse(impulse* 100*delta)
	


	
