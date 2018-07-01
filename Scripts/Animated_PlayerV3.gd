extends KinematicBody

#Jump state variables
var gravity = -9.8
var velocity = Vector3()
var in_air

#Node Variables
var manager
var anim_player
var anim_tree
var current_anim

#Other Variables
var inventory = []


func _ready():
	manager = get_node("../Game Manager/")
	anim_player = get_node("AnimationPlayer")
	pass

func _physics_process(delta):
	
	current_anim = anim_player.get_current_animation()
	
	velocity.y += gravity * delta
	
	var current_pos = get('translation')
	if translation.y <= -10:
		manager.game_active = false
		manager.game_over = true
	
	if velocity.y > 0:
		gravity = -20
	else:
		gravity = -30
		
	var collision = move_and_collide(velocity * delta)
	
	if in_air:
		if current_anim != "Jump":
			if current_anim != "Flip":
				anim_player.play("Jump")
	
	# Detects floor for jumps. Controls state for double jump.
	if collision:
		if anim_player.get_current_animation() != "Run":
			anim_player.play("Run")

		var collider = collision.get_collider()
		if collider.point_givable:
			collider.give_point()
		in_air = false
		
		if Input.is_action_just_pressed('ui_up'):
			velocity.y = 10
			in_air = true
				
	elif Input.is_action_just_pressed('ui_up') and in_air and inventory.size() > 0:
			inventory.remove(0)
			if velocity.y < 3:
				velocity.y = 8
			else:
				velocity.y  += 8
			anim_player.play("Jump")
			#anim_tree.blend2_node_set_amount("Jump_Flip", 1)
		
			