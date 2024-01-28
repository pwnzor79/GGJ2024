extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	contact_monitor = true
	max_contacts_reported = 10

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _despawn():
	queue_free()

# Destroys player if they're hit with this attack
func _on_body_entered(body):
	if body.is_in_group("player"):
		body.explode()
	queue_free()
