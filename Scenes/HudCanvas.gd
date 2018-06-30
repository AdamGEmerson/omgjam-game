extends CanvasLayer

var coin
var main
var player

func _ready():
	main = get_parent()
	player = main.get_node("Player")
	for child in get_children():
		child.visible = false
	pass

func _process(delta):
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
		for child in get_children():
			child.visible = false
	