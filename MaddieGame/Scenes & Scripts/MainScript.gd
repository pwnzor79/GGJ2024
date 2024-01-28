extends Node2D

@export var enemyToSpawn: PackedScene
var score

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _spawn_timeout():
	var enemy = enemyToSpawn.instantiate()
	var spawnloc = $EnemyPath/EnemySpawner
	spawnloc.progress_ratio = randf()
	
