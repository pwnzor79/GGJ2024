extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$MAGroup.visible = true
	$HnGroup.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	redr

func _on_ma_timer_timeout():
	$MAGroup.visible = false
	$MAGroup/MoveAim.set_text("honk")
	$MAGroup.queue_free()
	$HnGroup.visible = true


func _on_honk_timer_timeout():
	$HnGroup.visible = false
	$HnGroup/HonkLabel.text.erase()
	queue_free()
