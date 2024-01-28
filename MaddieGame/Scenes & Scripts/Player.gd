extends Area2D

@export var speed = 500
@export var Pie = preload("res://MaddieGame/Scenes & Scripts/Pie.tscn")
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	$AnimatedSprite2D.animation = "up_down"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	# Processes movement input, and updates animations accordingly
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("right"):
		velocity.x += 1
		$AnimatedSprite2D.animation = "right"
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		$AnimatedSprite2D.animation = "left"
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		
	# Resets animation to standard if not turning
	if Input.is_action_just_released("right") or Input.is_action_just_released("left"):
		$AnimatedSprite2D.animation = "up_down"

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	$AnimatedSprite2D.play()
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	# Checks if the player fires a pie
	if Input.is_action_just_pressed("maddie_shoot"):
		fire()


# Fires a pie upwards out of the marker
func fire():
	var p = Pie.instantiate()
	owner.add_child(p)
	p.transform = $Marker2D.global_transform
