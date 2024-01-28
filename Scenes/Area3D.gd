extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/CadeScene/enemy/CharacterBody3D").set_process(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var start_active = false
func _on_body_entered(body):
	if (start_active == false):
		start_active = true
		return
	print("Setting hunt active")
	get_node("/root/CadeScene/enemy/CharacterBody3D").set_process(true)
	var spawn_pos = get_node("/root/CadeScene/enemy/spawn").position
	get_node("/root/CadeScene/enemy/CharacterBody3D").position = spawn_pos