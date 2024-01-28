extends Control

@export var scenes = []
@export var finalScene: Node3D
var scenesVisited = {}
var timeBetweenScenes = Vector2(30,60)
var minScenesToVisit = 6
var numScenesVisited = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	while true:
		scenes.shuffle()
		add_child(scenes[0])
		# if visited randomize music
		scenesVisited[scenes[0]] = true
		var time = randf_range(timeBetweenScenes.x, timeBetweenScenes.y)
		await get_tree().create_timer(time).timeout
		remove_child(scenes[0])
		#do static
		
		if checkCompletion():
			add_child(finalScene)
			break

func checkCompletion():
	if numScenesVisited >= minScenesToVisit:
		for scene in scenesVisited:
			if scenesVisited[scene] == false:
				return false
		return true
	else:
		return false

