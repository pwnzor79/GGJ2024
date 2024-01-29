extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/Control/CadeScene/enemy/CharacterBody3D").set_process(false)
	willie_scream_stream = get_node("/root/CadeScene/enemy/CharacterBody3D/CollisionShape3D/willie_scream")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var chase_active = false
var start_active = false
var willie_scream_stream
func _on_body_entered(body):
	if (start_active == false):
		start_active = true
		return
	if (!chase_active):
		print("Setting hunt active")
		get_node("/root/Control/CadeScene/enemy/CharacterBody3D").set_process(true)
		var spawn_pos = get_node("/root/CadeScene/enemy/spawn").position
		get_node("/root/Control/CadeScene/enemy/CharacterBody3D").position = spawn_pos
		chase_active = true
		get_node("/root/Control/CadeScene/player/ChaseStart").play()
		get_node("/root/Control/CadeScene/enemy/CharacterBody3D/CollisionShape3D/willie_sound").play()
		willie_scream_stream.play()
		await(willie_scream_stream.finished)
		get_node("/root/Control/CadeScene/player/MusicCaveCalm").stop()
		get_node("/root/Control/CadeScene/player/MusicCaveChase").play()
