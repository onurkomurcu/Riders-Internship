extends Label
var numSkittlePins : int = 10
var score : int = 0
var skittlePinScored : Array = []

func _ready():
	for x in range(numSkittlePins):
		skittlePinScored.append(false)

func _process(delta):
	for i in range(1, numSkittlePins + 1):
		var skittle_pin = get_node("/root/Environment/Skittle Pin" + str(i))
		
		if skittle_pin and skittle_pin.global_transform.origin.y != 0.25 and not skittlePinScored[i-1]:
			score += 1
			skittlePinScored[i-1] = true

	set_text("Score: %s" % str(score))
