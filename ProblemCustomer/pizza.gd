extends Node2D

var draggable = false
var is_inside_droppable = false
var body_ref
var initialPos = global_position

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("left_click"):
			initialPos = global_position
		elif Input.is_action_pressed("left_click"):
			global_position = get_global_mouse_position()
		elif Input.is_action_just_released("left_click"):
			Global.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_droppable:
				tween.tween_property(self, "position", body_ref.position, 0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self, "global_position", initialPos, 0.2).set_ease(Tween.EASE_OUT)


func _on_area_2d_body_entered(body):
	if body.is_in_group('droppable'):
		is_inside_droppable = true
		body.modulate = Color(Color.DIM_GRAY, 1)
		body.ref = body


func _on_area_2d_body_exited(body):
	if not Global.is_dragging:
		is_inside_droppable = false
		body.modulate = Color(Color.DIM_GRAY, 0.7)


func _on_area_2d_mouse_entered():
	if not Global.is_dragging:
		draggable = true
		scale = Vector2(1.05, 1.05)


func _on_area_2d_mouse_exited():
	if not Global.is_dragging:
		draggable = false
		scale = Vector2(1, 1)
