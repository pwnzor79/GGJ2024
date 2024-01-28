extends Area2D

signal hit

@export var speed = 400 # pixes/sec
@export var Honks: PackedScene
@onready var ray = $RayCast2D
var screen_size # Game window size
const GRAVITY = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	#hide()
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Arm follows mouse
	$Arm.look_at(get_global_mouse_position()) 
	$Arm.rotation_degrees -= -90
	
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("right"):
		ray.target_position = Vector2.RIGHT * 32
		ray.force_raycast_update()
		if !ray.is_colliding():
			velocity.x += 1
	if Input.is_action_pressed("left"):
		ray.target_position = Vector2.LEFT * 32
		ray.force_raycast_update()
		if !ray.is_colliding():
			velocity.x -= 1
	if Input.is_action_pressed("down"):
		ray.target_position = Vector2.DOWN * 32
		ray.force_raycast_update()
		if !ray.is_colliding():
			velocity.y += 1
	if Input.is_action_pressed("up"):
		ray.target_position = Vector2.UP * 32
		ray.force_raycast_update()
		if !ray.is_colliding():
			velocity.y -= 1
		
	if Input.is_action_just_pressed("honk") or Input.is_action_just_pressed("left_click"):
		honk()
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$Body.play()
	else:
		$Body.stop()
		
	if !$RayCast2D.is_colliding():
		position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x != 0:
		$Body.animation = "walk"
		$Body.flip_v = false
		# See the note below about boolean assignment.
		$Body.flip_h = velocity.x > 0

func _on_body_entered(body):
	if body.is_in_group("mobs"):
		hide() # Player disappears after being hit.
		hit.emit()
		$CollisionShape2D.set_deferred("disabled", true)
		# Must be deferred as we can't change physics properties on a physics callback.

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	
func honk():
	var h = Honks.instantiate()
	add_child(h)
	h.transform = $Arm.transform
	h.scale.x = 0.5
	h.scale.y = 0.5
	
	
