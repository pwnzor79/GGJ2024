extends Node2D

@export var speed = 600
@export var backgroundMusic: AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func skipBeginning(time):
	backgroundMusic.play(time)
		
