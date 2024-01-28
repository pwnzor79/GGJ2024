extends RigidBody2D

@export var speed = 0 # pixes/sec

# Called when the node enters the scene tree for the first time.
func _ready():
	if position.x < 960: #left side
		$Sprite2D.flip_h = false
		$CollisionShape2D.position.x += 944
	else: #right side
		$Sprite2D.flip_h = true
		$CollisionShape2D.position.x -= 944


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sprite2D.position.x += speed * delta
	$CollisionShape2D.position.x += speed * delta


func _on_timer_timeout():
	if position.x < 960: #left side
		speed = 1000
	else: #right side
		speed = -1000


func _on_reverse_timer_timeout():
	speed *= -1


func _on_visible_on_screen_notifier_2d_screen_exited():
	$DeleteTimer.start()


func _on_delete_timer_timeout():
	queue_free()
