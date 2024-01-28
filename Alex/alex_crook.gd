extends RigidBody2D

@export var speed = 0 # pixes/sec

# Called when the node enters the scene tree for the first time.
func _ready():
	if position.x < 0: #left side
		$Sprite2D.flip_h = false
	else: #right side
		$Sprite2D.flip_h = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += speed * delta


func _on_timer_timeout():
	if position.x < 0: #left side
		speed = 500
	else: #right side
		speed = -500
