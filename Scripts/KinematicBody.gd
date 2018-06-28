extends KinematicBody

var speed = 1.5
var direction = Vector3()

func _ready():
	pass

func _process(delta):
	translate(Vector3(0,0,-2) * delta)