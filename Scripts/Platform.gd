extends KinematicBody

var speed = 3
var direction = Vector3()
var manager

func _ready():
	manager = get_parent()
	pass

func _process(delta):
	if manager.game_active == true:
		translate(Vector3(0,0,-1 * speed) * delta)