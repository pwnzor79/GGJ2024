extends Node2D

var arrow = load("res://Alex/Alex_Art/Alex_cursor.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_custom_mouse_cursor(arrow)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
