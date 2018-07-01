extends AnimatedSprite

var timeElapsed = 0
var animation_complete = false

func _ready():
	
	pass

func _process(delta):
	timeElapsed = timeElapsed + delta
	
	if timeElapsed > 0.05:
		if get_frame() == (self.get_sprite_frames().get_frame_count('default') - 1):
			animation_complete = true
			self.playing = false
	if not animation_complete:
		set_frame(get_frame() + 1)
