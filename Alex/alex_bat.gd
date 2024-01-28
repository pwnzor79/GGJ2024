extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	rotation_degrees = 0
	$AnimatedSprite2D.play("fly")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func flip_bat():
	$AnimatedSprite2D.flip_v = false
	$AnimatedSprite2D.flip_h = true
