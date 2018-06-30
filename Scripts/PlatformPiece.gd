extends KinematicBody

var point_givable = true

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func give_point():
	get_parent().give_point()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
