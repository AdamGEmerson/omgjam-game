extends KinematicBody

var speed = 1.5
var direction = Vector3()
var manager = get_parent()

func _ready():
	pass

func _process(delta):
	while manager.game_active is true:
		translate(Vector3(0,0,-2) * delta)