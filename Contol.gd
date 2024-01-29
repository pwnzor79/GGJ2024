extends Control

#dictionary of scenes and their current playback values
@export var scenes = {}
@export var scenesArray = []
@export var finalScene = []
var timeBetweenScenes = Vector2(30,45)
var minScenesToVisit = 6
var numScenesVisited = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	for sceneTree in scenesArray:
		print(sceneTree)
		var scene = sceneTree.instantiate()
		print(scene)
		self.add_child(scene)
		# if visited set music to last position
		if scenes.get(sceneTree) > 0:
			scene.backgroundMusic.play(scenes.get(scene))
		else:
			scene.backgroundMusic.play()
		var time = randf_range(timeBetweenScenes.x, timeBetweenScenes.y)
		await get_tree().create_timer(time).timeout
		scenes[scene] = scene.backgroundMusic.get_playback_position()
		scene.queue_free()
		#$ShortCircus.do
	
	add_child(finalScene[0].instantiate())


# Called every frame. 'delta' is the elapsed time since the previous frame.



