extends CollisionShape2D
signal hit


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
# Detects when customer approaches the window 
func _on_body_entered(body):
	hit.emit()
	set_deferred("disabled", true)
	print("EEK!")
