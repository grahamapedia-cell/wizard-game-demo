extends StaticBody2D
@onready var direction = 5
@onready var frames = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_node("Hitbox").set_deferred("disabled",!get_node("..").visible)
	self.global_position.x+=direction
	frames+=1
	if self.global_position.x>50:
		direction = -5
		frames=0
	if self.global_position.x<-50:
		direction = 5
		frames=0
