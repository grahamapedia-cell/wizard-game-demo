extends Node2D
@export var amount: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible=true # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_node("../Inventory").hotbar[0]=="":
		get_node("Bar1/AnimatedSprite2D").animation = "empty"
	else:
		get_node("Bar1/AnimatedSprite2D").animation = get_node("../Inventory").hotbar[0]
	if get_node("../Inventory").hotbar[1]=="":
		get_node("Bar2/AnimatedSprite2D").animation = "empty"
	else:
		get_node("Bar2/AnimatedSprite2D").animation = get_node("../Inventory").hotbar[1]
	if get_node("../Inventory").hotbar[2]=="":
		get_node("Bar3/AnimatedSprite2D").animation = "empty"
	else:
		get_node("Bar3/AnimatedSprite2D").animation = get_node("../Inventory").hotbar[2]
	if get_node("../Inventory").hotbar[3]=="":
		get_node("Bar4/AnimatedSprite2D").animation = "empty"
	else:
		get_node("Bar4/AnimatedSprite2D").animation = get_node("../Inventory").hotbar[3]
	if get_node("../Inventory").hotbar[4]=="":
		get_node("Bar5/AnimatedSprite2D").animation = "empty"
	else:
		get_node("Bar5/AnimatedSprite2D").animation = get_node("../Inventory").hotbar[4]
	if get_node("../Inventory").hotbar[5]=="":
		get_node("Bar6/AnimatedSprite2D").animation = "empty"
	else:
		get_node("Bar6/AnimatedSprite2D").animation = get_node("../Inventory").hotbar[5]
	if get_node("../Inventory").hotbar[6]=="":
		get_node("Bar7/AnimatedSprite2D").animation = "empty"
	else:
		get_node("Bar7/AnimatedSprite2D").animation = get_node("../Inventory").hotbar[6]
	if get_node("../Inventory").hotbar[7]=="":
		get_node("Bar8/AnimatedSprite2D").animation = "empty"
	else:
		get_node("Bar8/AnimatedSprite2D").animation = get_node("../Inventory").hotbar[7]
	if get_node("../Inventory").hotbar[8]=="":
		get_node("Bar9/AnimatedSprite2D").animation = "empty"
	else:
		get_node("Bar9/AnimatedSprite2D").animation = get_node("../Inventory").hotbar[8]
	
	if Input.is_action_just_pressed("open_inventory"):
		self.visible=get_node("../Hotbar").visible
