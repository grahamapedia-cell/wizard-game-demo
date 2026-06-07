extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("use_item") and get_node("../Inventory").visible==false:
		pass
		#this should be putting the scrolls in the spellbook
