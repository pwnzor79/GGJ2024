extends Area2D

const TARGET_Y = 984
const SPAWN_Y = -16
const DIST_TO_TARGET = TARGET_Y - SPAWN_Y

const LEFT_LANE_SPAWN = Vector2(697, SPAWN_Y)
const CENTRE_LANE_SPAWN = Vector2(949, SPAWN_Y)
const RIGHT_LANE_SPAWN = Vector2(1184, SPAWN_Y)

var speed = 0
var hit = false


func _ready():
	pass


func _physics_process(delta):
	if !hit:
		position.y += speed * delta
		if position.y > 984:
			queue_free()
			get_parent().reset_combo()
	else:
		$Node2D.position.y -= speed * delta


func initialize(lane):
	if lane == 0:
		$AnimatedSprite2D.frame = 0
		position = LEFT_LANE_SPAWN
	elif lane == 1:
		$AnimatedSprite2D.frame = 1
		position = CENTRE_LANE_SPAWN
	elif lane == 2:
		$AnimatedSprite2D.frame = 2
		position = RIGHT_LANE_SPAWN
	else:
		printerr("Invalid lane set for note: " + str(lane))
		return
	
	speed = DIST_TO_TARGET/1.5


func destroy(score):
	$CPUParticles2D.emitting = true
	$AnimatedSprite2D.visible = false
	$Timer.start()
	hit = true
	if score == 3:
		$Node2D/Label.text = "PERFECT!"
		$Node2D/Label.modulate = Color("f6d6bd")
		$HonkHonk.play()
	elif score == 2:
		$Node2D/Label.text = "GOOD"
		$Node2D/Label.modulate = Color("c3a38a")
		$HonkHonk.play()
	elif score == 1:
		$Node2D/Label.text = "OKAY"
		$HonkHonk.play()
		$Node2D/Label.modulate = Color("997577")


func _on_timer_timeout():
	queue_free()
