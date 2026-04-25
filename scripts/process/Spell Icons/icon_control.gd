extends Node2D
@export var spell = "Empty"
@export var page = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if page==0:
		get_node("..").iconshere[0]="Left"
	else:
		get_node("..").iconshere[1]="Right"
	print(self.name) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
