extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("use_item") and get_node("../Inventory").visible==false and get_node("../Inventory").hotbarnumber[get_node("../Hotbar_Selector").slot]>0:
		if get_node("../Inventory").hotbar[get_node("../Hotbar_Selector").slot][2][0]=="Scroll":
			if get_node("../Inventory").spellbookfull==false:
				get_node("../Inventory").spellbook=get_node("../Inventory").hotbar[get_node("../Hotbar_Selector").slot]
				get_node("../Inventory").hotbarnumber[get_node("../Hotbar_Selector").slot]-=1
			else:
				get_node("../Inventory").spellbook[2][3].push_back(get_node("../Inventory").hotbar[get_node("../Hotbar_Selector").slot][2][3][0])
				get_node("../Inventory").hotbarnumber[get_node("../Hotbar_Selector").slot]-=1
		#this should be putting the scrolls in the spellbook
