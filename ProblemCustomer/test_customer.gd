extends Area2D
signal hit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Displays this customer's order above their head and to the right.
func display_order():
	var order_position = Vector2(416, 64)
	
	var new_order = $TestOrder.instance()
	new_order.position = order_position
