extends Spatial

# class member variables go here, for example:
var game_active
var score = 0
var scoreboard

func spawn_platform():
	var next_plat = preload("res://Scenes/Platform.tscn").instance()
	print("Platform Spawned")
	add_child(next_plat)


func _ready():
	scoreboard = get_node("Score/Label")
	game_active = true
	$GameOver.hide()

func _process(delta):
	if game_active:
		pass
	else:
		$GameOver.show()
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().reload_current_scene()
	scoreboard.text = str(score)