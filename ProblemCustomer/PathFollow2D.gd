extends PathFollow2D

@export var move_speed = 0.5

var scene = preload("res://ProblemCustomer/TestOrder.tscn")
var is_moving = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not get_progress_ratio() == 1:
		set_progress_ratio(get_progress_ratio() + move_speed * delta)
	else:
		is_moving = false
	
	# If customer has reached the front of the line, displays their order above their head.
	if is_moving == false:
		var order_position = Vector2(position.x, position.y - 50)
		var new_order = scene.instantiate()
		
		new_order.position = order_position


