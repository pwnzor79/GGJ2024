extends Control

#dictionary of scenes and their current playback values
@export var scenes = {}
@export var scenesArray = []
@export var finalScene = []
@export var sceneCodes = {}
@export var cadeSceneCodes = {}
@export var doriSceneCodes = {}
@export var timeBetweenScenes = Vector2(25,30)
#var minScenesToVisit = 6
#var numScenesVisited = 0

var currentScene = null
# Called when the node enters the scene tree for the first time.
func _ready():
	scenesArray.shuffle()
	for sceneTree in scenesArray:
		await $AnimatedSprite2D.do_static(0.5)
		var scene = sceneTree.instantiate()
		self.add_child(scene)
		currentScene = scene
		# if visited set music to last position (doesnt work lol)
		if scenes.get(sceneTree) > 0:
			scene.backgroundMusic.play(scenes.get(scene))
		else:
			scene.backgroundMusic.play()
		var time = randf_range(timeBetweenScenes.x, timeBetweenScenes.y)
		await get_tree().create_timer(time).timeout
		if (!is_instance_valid(scene)):
			return
		scenes[scene] = scene.backgroundMusic.get_playback_position()
		scene.queue_free()
		Input.set_custom_mouse_cursor(null)
	
	self.PRESET_CENTER
	await $AnimatedSprite2D.do_static(2)
	add_child(finalScene[0].instantiate())



func _input(event):
	if !event.is_pressed():
		return
	for code in sceneCodes:
		if event.as_text().to_lower() == "ctrl+" + code:
			var i = 1
			while(is_instance_valid(self.get_child(i))):
				get_child(i).queue_free()
				i+=1
			self.PRESET_TOP_LEFT
			Input.set_custom_mouse_cursor(null)
			await $AnimatedSprite2D.do_static(0.5)
			var scene = sceneCodes[code].instantiate()
			add_child(scene)
			scene.backgroundMusic.play()
	
	for code in cadeSceneCodes:
		if event.as_text().to_lower() == "ctrl+" + code:
			var i = 1
			while(is_instance_valid(self.get_child(i))):
				get_child(i).queue_free()
				i+=1
			Input.set_custom_mouse_cursor(null)
			self.PRESET_CENTER
			await $AnimatedSprite2D.do_static(2)
			var scene = cadeSceneCodes[code].instantiate()
			add_child(scene)

	for code in doriSceneCodes:
		if event.as_text().to_lower() == "ctrl+" + code:
			var i = 1
			while(is_instance_valid(self.get_child(i))):
				get_child(i).queue_free()
				i+=1
			Input.set_custom_mouse_cursor(null)
			self.PRESET_TOP_LEFT
			await $AnimatedSprite2D.do_static(0.5)
			var scene = doriSceneCodes[code].instantiate()
			add_child(scene)
		
	#if Input.is_key_pressed(KEY_CTRL):
		



