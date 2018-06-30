extends Spatial

var game_active
var score = 0
var scoreboard
var platform_queue = []

func add_to_platform_queue():
	var next_plat = preload("res://Scenes/Platform.tscn").instance()
	platform_queue.append(next_plat)

func spawn_platform(Vector):
	var platform = platform_queue.pop_front()
	platform.translate(Vector)
	add_child(platform)


func _ready():
	scoreboard = get_node("Score")
	game_active = true
	$GameOver.hide()

func _process(delta):
	if game_active:
		if platform_queue.size() < 5:
			add_to_platform_queue()
	else:
		$GameOver.show()
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().reload_current_scene()
	scoreboard.text = str(score)