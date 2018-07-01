extends Area

var main
var manager
var platform

func _ready():
	main = get_tree().get_root().get_node("Main")
	manager = main.get_node("Game Manager")

func _on_PointBox_body_entered( body ):
	if body is KinematicBody:
		manager.score += 1
		queue_free()
