extends Node2D

var speed = -500
var screen_size


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Despawns pie if it leaves screen
	if position < Vector2.ZERO:
		queue_free()


# Processes projectile movement
func _physics_process(delta):
	position += transform.y * speed * delta
	

# Detects collision with mobs and despawns projectile
func _on_area_2d_body_entered(body):
	if body.is_in_group("mobs"):
		body.pop()
	queue_free()
