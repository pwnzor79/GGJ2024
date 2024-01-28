extends Node2D

@export var bat_scene: PackedScene
@export var crook_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func new_game():
	$GameOver.hide()
	$Alex_Player.start($StartPosition.position)
	$StartTimer.start()

func _on_start_timer_timeout():
	$BatTimer.start()
	$CrookTimer.start()
	$Crook2Timer.start()

func _on_bat_timer_timeout():
	# Create a new instance of the Mob scene.
	var bat = bat_scene.instantiate()

	# Choose a random location on Path2D.
	var bat_spawn_location = $BatPath/BatSpawnLocation
	bat_spawn_location.progress_ratio = randf()

	# Set the mob's direction perpendicular to the path direction.
	var direction = bat_spawn_location.rotation + PI / 2

	# Set the mob's position to a random location.
	bat.position = bat_spawn_location.position

	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	bat.rotation = direction
	
	if direction < (PI / 2):
		bat.flip_bat()
	
	# Choose the velocity for the mob.
	var velocity = Vector2(randf_range(200.0, 350.0), 0.0)
	bat.linear_velocity = velocity.rotated(direction)

	# Spawn the mob by adding it to the Main scene.
	add_child(bat)

func _on_crook_timer_timeout():
	var crookA = crook_scene.instantiate()
	var crookA_spawn_location = $CrookPath/CrookSpawnLocation
	crookA_spawn_location.progress_ratio = randf()
	crookA.position = crookA_spawn_location.position
	add_child(crookA)
	
	
func _on_crook_2_timer_timeout():
	var crookB = crook_scene.instantiate()
	var crookB_spawn_location = $Crook2Path/Crook2SpawnLocation
	crookB_spawn_location.progress_ratio = randf()
	crookB.position = crookB_spawn_location.position
	add_child(crookB)
	
func game_over_bat():
	$BatTimer.stop()
	$CrookTimer.stop()
	$Crook2Timer.stop()
	$GameOver.show()



