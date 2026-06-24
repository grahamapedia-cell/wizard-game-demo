extends AnimatedSprite2D
@export var anim = "Empty"
var height = 0
var heightmod = 0.025

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.animation= anim # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if self.visible==true:
		offset.y+=heightmod
		height+=heightmod
	if height>=1:
		heightmod=-0.025
	if height<=-1:
		heightmod=0.025
