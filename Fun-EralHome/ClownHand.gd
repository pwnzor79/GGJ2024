extends Node


# Load the custom images for the mouse cursor.
var arrow = load("res://Fun-EralHome/Fun-EralHomeArt/Clown Head.png")
var beam = load("res://Fun-EralHome/Fun-EralHomeArt/Clown Head.png")


func _ready():
	# Changes only the arrow shape of the cursor.
	# This is similar to changing it in the project settings.
	Input.set_custom_mouse_cursor(arrow)

	# Changes a specific shape of the cursor (here, the I-beam shape).
	Input.set_custom_mouse_cursor(beam, Input.CURSOR_IBEAM)
