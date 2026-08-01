extends Node2D
@export var game: PackedScene
var play
var playing=false
var mousein=false
var load=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if FileAccess.file_exists("user://savegame.save"):
		get_node("Newgame").modulate = Color(0,0,0)
	else:
		get_node("Newgame").hide()
	get_node("Area2D").modulate = Color(0,0,0) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mousein==true and playing==false and Input.is_action_just_pressed("cast_spell"):
		play=game.instantiate()
		if load==true:
			play.loading=true
		add_child(play)
		playing=true
		get_node("Area2D").visible=false
		get_node("BG").visible=false

func _on_area_2d_mouse_entered() -> void:
	mousein=true
	if FileAccess.file_exists("user://savegame.save"):
		load=true
	get_node("Area2D").modulate = Color(0.2,0.2,0.2)


func _on_area_2d_mouse_exited() -> void:
	mousein=false
	load=false
	get_node("Area2D").modulate = Color(0,0,0)


func _on_newgame_mouse_entered() -> void:
	load=false
	mousein=true
	get_node("Newgame").modulate = Color(0.2,0.2,0.2)


func _on_newgame_mouse_exited() -> void:
	mousein=false
	get_node("Newgame").modulate = Color(0,0,0)
