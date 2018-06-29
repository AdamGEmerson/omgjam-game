extends VisibilityNotifier

var parent
var killable
var children

func _ready():
	parent = get_parent()
	pass

func _process(delta):
	if killable:
		children = parent.get_child_count()
		if children >= 5:
			pass
		else:
			parent.queue_free()
			print("master killed")


func _on_VisibilityNotifier_screen_exited():
	killable = true
