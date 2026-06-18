extends Node2D
@export var game: PackedScene
var play
var playing=false
var mousein=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("Area2D").modulate = Color(0,0,0) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mousein==true and playing==false and Input.is_action_just_pressed("cast_spell"):
		play=game.instantiate()
		add_child(play)
		playing=true
		get_node("Area2D").visible=false
		get_node("Sprite2D").visible=false
		get_node("BG").visible=false


func _on_area_2d_mouse_entered() -> void:
	mousein=true
	get_node("Area2D").modulate = Color(0.2,0.2,0.2)


func _on_area_2d_mouse_exited() -> void:
	mousein=false
	get_node("Area2D").modulate = Color(0,0,0)
