extends Spatial

var game_active
var score = 0
var scoreboard
var main
var canvas
var game_over = false
var title_screen = true
var platform_queue = []

func add_to_platform_queue():
	var next_plat = preload("res://Scenes/Platform.tscn").instance()
	platform_queue.append(next_plat)

func spawn_platform(Vector):
	var platform = platform_queue.pop_front()
	platform.translate(Vector)
	add_child(platform)
	
func game_over_write():
	var game_over_screen = preload("res://Scenes/GameOverSprite.tscn").instance()
	game_over_screen.set_frame(0)
	canvas.add_child(game_over_screen)
	canvas.game_over = true
	game_over = false

func title_screen_write():
	pass


func _ready():
	main = get_parent()
	canvas = main.get_node("CanvasLayer")
	scoreboard = canvas.get_node("Score")
	
	#canvas.get_node("GameOverOld").hide()

func _process(delta):
	if game_active:
		if platform_queue.size() < 5:
			add_to_platform_queue()
	else:
		if game_over:
				game_over_write()
		#canvas.get_node("GameOverOld").show()
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().reload_current_scene()
	scoreboard.text = str(score)