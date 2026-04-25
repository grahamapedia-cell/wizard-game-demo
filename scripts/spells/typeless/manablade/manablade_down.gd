extends CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_manablade_down() -> void:
	show() # Replace with function body.


func _on_manablade_stop() -> void:
	hide() # Replace with function body.
