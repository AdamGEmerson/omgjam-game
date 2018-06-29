extends VisibilityNotifier

var parent
var killable
var timer = 50

func _ready():
	parent = get_parent()
	pass

func _process(delta):
	if killable:
		timer -= 1
		if timer < 1:
			parent.queue_free()
	

func _on_VisibilityNotifier_screen_exited():
	killable = true
