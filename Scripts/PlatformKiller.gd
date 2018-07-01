extends Area

#func _ready():
#	# Called every time the node is added to the scene.
#	# Initialization here
#	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
	
func spawn_platform():
	var next_plat = preload("res://Scenes/Platform.tscn").instance()
	var plat_manager = get_parent()
	print("Platform Spawned")
	plat_manager.add_child(next_plat)

func _on_Platform_Killer_body_entered( body ):
	if body is KinematicBody:
		print("Platform deleted.")
		body.queue_free()
		
		spawn_platform()
		
	
