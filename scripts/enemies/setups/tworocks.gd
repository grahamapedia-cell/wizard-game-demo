extends Node2D
@export var mean_rock: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var enemy=mean_rock.instantiate()
	enemy.spawnRadius = 50
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
