extends AnimatedSprite2D
@export var number = 0
@export var type = ""
@export var offset_x = 0
@export var offset_y = 0
@export var first = true
var opacity=1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x+=offset_x
	self.animation="Numbers"
	self.frame=number%10
	self.pause # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
