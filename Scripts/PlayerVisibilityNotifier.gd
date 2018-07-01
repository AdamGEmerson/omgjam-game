extends VisibilityNotifier

var parent
var killable
var timer = 50
var main

func _ready():
	parent = get_parent()
	main = parent.get_parent().get_node("Game Manager")
	pass

func _process(delta):
	if killable:
		timer -= 1
		if timer < 1:
			parent.queue_free()
			print("Player Killed")
	

func _on_VisibilityNotifier_screen_exited():
	parrqueue_free()
	main.game_active = false

