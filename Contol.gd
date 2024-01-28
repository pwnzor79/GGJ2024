extends Control

@export var scenes = []
var scenesVisited = {}
var timeBetweenScenes = Vector2(30,60)
var minScenesToVisit = 6
var numScenesVisited = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scenes.shuffle()
	add_child(scenes[0])
	pass
