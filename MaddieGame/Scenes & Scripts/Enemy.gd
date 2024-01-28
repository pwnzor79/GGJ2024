extends RigidBody2D

@export var bulletToSpawn: PackedScene
var is_dying = false
var death_countdown = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Checks if the player is dying, and plays the death animation
	if is_dying == true:
		if death_countdown == 0:
			$AnimatedSprite2D.animation = "die"
			death_countdown += 10
		elif death_countdown == 350:
			queue_free()
		else: death_countdown += 10
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func pop():
	is_dying = true

func _timeout():
	var bullet = bulletToSpawn.instantiate()
	get_tree().root.add_child(bullet)
	bullet.transform = $Marker2D.global_transform
