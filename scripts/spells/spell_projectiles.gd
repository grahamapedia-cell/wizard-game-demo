extends Node2D
@export var spell = ""
#summoned used to do something, but who knows, I might use it later
@export var summoned = true
@export var ang = 0
@export var distance = 0
@export var path=""
var deathtime = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if deathtime==true:
		queue_free()
