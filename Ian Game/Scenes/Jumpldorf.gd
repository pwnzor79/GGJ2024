extends CharacterBody2D

@export var gravity = 980
@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0
@export var RELEASE_IMPULSE = 200
@export var RELEASE_GRAVITY_RATIO = 0.5
@export var fallingGravityRatio = 0.5
@export var JUMPS = 2
@export var backwards_force_scale = 0.5

var jumpsRemaining = JUMPS

func do_game_manager_force(delta):
	position.x -= IanGameManager.speed * backwards_force_scale * delta

func _process(delta):
	do_game_manager_force(delta)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		if not Input.is_action_pressed("up"):
			velocity.y += gravity * RELEASE_GRAVITY_RATIO * delta
	else:
		jumpsRemaining = JUMPS
	
	if velocity.y < 0:
		velocity.y += gravity * fallingGravityRatio * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("up") and jumpsRemaining > 0:
		velocity.y = JUMP_VELOCITY
		jumpsRemaining-=1
	
	if Input.is_action_just_released("up") and not is_on_floor():
		velocity.y += RELEASE_IMPULSE
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	position = position.clamp(Vector2.ZERO, get_viewport_rect().size)
	move_and_slide()
