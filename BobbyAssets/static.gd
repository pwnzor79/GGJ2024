extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false
	#do_static(0.5)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func do_static(time):
	self.visible = true
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(time).timeout
	$AudioStreamPlayer2D.stop()
	self.visible = false

func toggleVisibility():
	self.visible = !self.visible
