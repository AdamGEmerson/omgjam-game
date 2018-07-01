extends CanvasLayer

var coin
var main
var player
var manager
var game_over = false

func _ready():
	main = get_parent()
	player = main.get_node("Player")
	manager = main.get_node("Game Manager")
	for child in get_children():
		child.visible = false
	get_node("TitleScreenOld").visible = true
	if Input.is_action_just_pressed("ui_accept"):
		manager.game_active = true
		get_node("TitleScreenOld").visible = false
		manager.title_screen = false
	pass

func _process(delta):
	if game_over:
		pass
	else:
		if manager.game_active:
			get_node("Score").visible = true
		if player.inventory.size() == 1:
			$coinicon.visible = true
			$coinicon2.visible = false
			$coinicon3.visible = false
		elif player.inventory.size() == 2:
			$coinicon.visible = true
			$coinicon2.visible = true
			$coinicon3.visible = false
		elif player.inventory.size() == 3:
			$coinicon.visible = true
			$coinicon2.visible = true
			$coinicon3.visible = true
		else:
			$coinicon.visible = false
			$coinicon2.visible = false
			$coinicon3.visible = false