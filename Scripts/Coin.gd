extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	rotate_y(deg2rad(180 * delta))


func _on_Coin_body_entered( body ):
	if body is KinematicBody:
		
		if body.inventory.size() < 3:
			body.inventory.append("Power-Up")
		queue_free()
