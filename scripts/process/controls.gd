extends Area2D
var mouseIn = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("../ControlsScreen").visible=false # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("cast_spell") and mouseIn==true:
		self.visible=false
		get_node("../Sprite2D").visible=false
		get_node("../Unpause").visible=false
		get_node("../Quit").visible=false
		get_node("../ControlsScreen").visible=true


func _on_mouse_entered() -> void:
	mouseIn=true
	print("mouse")
	get_node("../AnimatedSprite2D").position.y=-20
	get_node("../AnimatedSprite2D").visible=true


func _on_mouse_exited() -> void:
	mouseIn=false
	print("rat")
	get_node("../AnimatedSprite2D").visible=false
