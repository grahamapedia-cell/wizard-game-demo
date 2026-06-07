extends Node2D
@export var game: PackedScene
var play
var playing=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_mouse_entered() -> void:
	if playing==false:
		play=game.instantiate()
		add_child(play)
		playing=true
		get_node("Area2D").visible=false
