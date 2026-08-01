extends Node2D
@export var cropname="Pepper"
@export var data=["Materials","Pepper",["Crops",[1,1,1],"Fire",["Fire Essence",1,[1,0.4,0]]]]
var days =0
var grown=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	days=get_node("..").days
	grown=get_node("..").grown


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
