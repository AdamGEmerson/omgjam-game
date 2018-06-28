extends Area

# class member variables go here, for example:
# var a = 2
var manager

func _ready():
	manager = get_parent()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Killbox_body_entered( body ):
	if body is KinematicBody:
		manager.game_active = false