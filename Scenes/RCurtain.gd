extends CanvasLayer
var r_moving = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if r_moving:
		offset.x += 400 * delta


func _on_rc_timer_timeout():
	r_moving = true


func _on_rc_kill_timeout():
	queue_free()
