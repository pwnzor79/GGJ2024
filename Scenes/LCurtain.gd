extends CanvasLayer
var l_moving = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if l_moving:
		offset.x -= 400 * delta


func _on_lc_timer_timeout():
	l_moving = true


func _on_lc_kill_timeout():
	queue_free()
