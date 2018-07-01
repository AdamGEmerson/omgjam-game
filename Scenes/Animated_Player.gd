extends KinematicBody

#Jump state variables
var gravity = -9.8
var velocity = Vector3()
var in_air
var double_timer = 0
var double_cd = 200

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
	anim_tree = get_node("AnimationTreePlayer")
	pass

func _physics_process(delta):
	
	current_anim = anim_player.get_current_animation()
	
	velocity.y += gravity * delta
	
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
				
	elif Input.is_action_just_pressed('ui_up') and in_air:
		if double_timer <= 0:
			if velocity.y < 3:
				velocity.y = 8
			else:
				velocity.y  += 8
			double_timer = double_cd
			anim_player.play("Flip")
			#anim_tree.blend2_node_set_amount("Jump_Flip", 1)
			get_node("../Game Manager/Double").hide()

	# Subtracts from double jump cool down each frame.
	if double_timer > 0:
		double_timer -= 1
	else:
		get_node("../Game Manager/Double").show()
	
	for item in inventory:
		
			