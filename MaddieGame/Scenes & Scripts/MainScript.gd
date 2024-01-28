extends Node2D

@export var enemyToSpawn: PackedScene
@export var backgroundMusic: AudioStreamPlayer2D
var game_over = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$HUD/ControlsMessage.show()
	#$BGM.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _spawn_timeout():
	var enemy = enemyToSpawn.instantiate()
	var spawnloc = $EnemyPath/EnemySpawner
	spawnloc.progress_ratio = randf()
	enemy.position = spawnloc.position
	enemy.apply_central_impulse(Vector2(randf_range(-100, 100), randf_range(350,600)))
	add_child(enemy)

# Called when the player is hit
func _on_player_game_over():
	$Explosion.play()
	game_over = true
	print("Player loses here")

# Fades out controls message on timeout
func _on_message_timer_timeout():
	$HUD/ControlsMessage.hide()
	
	
func skipBeginning(time):
	backgroundMusic.play(time)
		

