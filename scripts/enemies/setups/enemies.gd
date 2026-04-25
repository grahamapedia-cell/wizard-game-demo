extends Node2D
@export var mean_rock: PackedScene
@export var rockspitter: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var enemy = mean_rock.instantiate()
	add_child(enemy)
	enemy = mean_rock.instantiate()
	enemy.position.x -=100
	add_child(enemy)
	enemy = rockspitter.instantiate()
	enemy.position.y +=100
	add_child(enemy)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
func _on_mean_rock_defeat() -> void:
	await get_tree().create_timer(5).timeout
	var enemy = mean_rock.instantiate()
	add_child(enemy)
