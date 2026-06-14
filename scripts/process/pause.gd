extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("AnimatedSprite2D").visible=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.visible=get_tree().is_paused()
	if Input.is_action_just_pressed("pause"):
		if get_node("../Inventory_things/Inventory").visible==true:
			get_node("../Inventory_things/Inventory").visible=false
		else:
			get_tree().paused=!get_tree().paused
			print(get_tree().is_paused())
