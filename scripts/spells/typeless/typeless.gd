extends Node2D
@export var selected_spell = ""


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if selected_spell !="":
		if selected_spell=="Manablade":
			pass
		if selected_spell=="Manahammer":
			pass
		selected_spell=""
