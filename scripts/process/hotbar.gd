extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("use_item") and get_node("../Inventory").visible==false:
		if get_node("../Inventory").hotbardata[get_node("../Hotbar_Selector").slot].size()>=2:
			if get_node("../Inventory").hotbardata[get_node("../Hotbar_Selector").slot][1]=="Scroll" and get_node("../Inventory").spellbookfull==true:
				if get_node("../Inventory").spells[1]!="Scroll":
					get_node("../Inventory").spells.push_back(get_node("../Inventory").hotbardata[get_node("../Hotbar_Selector").slot][2][0])
					get_node("../Spellbook").pages.push_back(get_node("../Inventory").hotbardata[get_node("../Hotbar_Selector").slot][2][0])
					get_node("../Inventory").hotbarnumber[get_node("../Hotbar_Selector").slot]-=1
					if get_node("../Inventory").hotbarnumber[get_node("../Hotbar_Selector").slot]==0:
						get_node("../Inventory").hotbar[get_node("../Hotbar_Selector").slot]=""
						get_node("../Inventory").hotbaralpha[get_node("../Hotbar_Selector").slot]=Color(1,1,1)
						get_node("../Inventory").hotbardata[get_node("../Hotbar_Selector").slot]=[]
