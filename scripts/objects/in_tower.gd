extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_node("..").visible==false:
		get_node("CollisionPolygon2D").disabled=true
		get_node("CollisionShape2D").disabled=true
		get_node("Hitbox").disabled=true
		hide()
	else:
		get_node("CollisionPolygon2D").disabled=false
		get_node("CollisionShape2D").disabled=false
		get_node("Hitbox").disabled=false
		show()
