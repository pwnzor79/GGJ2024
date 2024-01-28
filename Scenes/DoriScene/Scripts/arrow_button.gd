extends AnimatedSprite2D

var perfect = false
var good = false
var okay = false
var current_note = null
var game = load("res://Scenes/DoriScene/Scenes/DoriScene.tscn")


func _unhandled_input(event):
	if event.is_action("AnyArrowKey"):
		if event.is_action_pressed("AnyArrowKey", false):
			if current_note != null:
				if perfect:
					get_parent().increment_score(3)
					current_note.destroy(3)
				elif good:
					get_parent().increment_score(2)
					current_note.destroy(2)
				elif okay:
					get_parent().increment_score(1)
					current_note.destroy(1)
				_reset()
			else:
				get_parent().increment_score(0)
		if event.is_action_pressed("left"):
			if animation == "left":
				frame = 1
		if event.is_action_pressed("right"):
			if animation == "right":
				frame = 1
		if event.is_action_pressed("up"):
			if animation == "up":
				frame = 1
		elif event.is_action_released("AnyArrowKey"):
			$PushTimer.start()

func _reset():
	current_note = null
	perfect = false
	good = false
	okay = false


func _on_perfetct_area_area_entered(area):
	if area.is_in_group("note"):
		perfect = true


func _on_perfetct_area_area_exited(area):
	if area.is_in_group("note"):
		perfect = false


func _on_great_area_area_entered(area):
	if area.is_in_group("note"):
		good = true


func _on_great_area_area_exited(area):
	if area.is_in_group("note"):
		good = false


func _on_okay_area_area_entered(area):
	if area.is_in_group("note"):
		okay = true
		current_note = area


func _on_okay_area_area_exited(area):
		if area.is_in_group("note"):
			okay = false
			current_note = null


func _on_push_timer_timeout():
	frame = 0
