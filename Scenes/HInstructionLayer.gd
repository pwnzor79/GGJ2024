extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hi_add_timeout():
	show()


func _on_alex_player_sig_honk():
	hide()
