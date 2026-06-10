extends Sprite2D
@export var pages = []
@export var page = 1
@export var spellicon: PackedScene
var killswitch = false
@export var iconshere = ["",""]
var licon
var ricon

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if iconshere[0]!="Left":
		if pages.is_empty()==false:
			licon = spellicon.instantiate()
			licon.spell = pages[0]
			licon.page=0
			licon.position=get_node("PageL").position
			add_child(licon)
		else:
			licon = spellicon.instantiate()
			licon.spell = "Empty"
			licon.page=0
			licon.position=get_node("PageL").position
			add_child(licon)
	if iconshere[1]!="Right":
		if pages.size()>1:
			ricon = spellicon.instantiate()
			ricon.spell = pages[1]
			ricon.page=1
			ricon.position=get_node("PageR").position
			add_child(ricon)
		else:
			ricon = spellicon.instantiate()
			ricon.spell = "Empty"
			ricon.page=1
			ricon.position=get_node("PageR").position
			add_child(ricon)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if pages.size()==0:
		hide()
	else:
		show()
	if get_node("/root/titlescreen/Game/Ysortedthings/player/Spells").currentlyCasting==true:
		#If we're casting a spell, the spell is darkened to show it's on cooldown.
		if licon.spell=="Empty":
			licon.modulate=Color(1,1,1)
		else:
			licon.modulate=Color(0.7,0.7,0.7)
		if ricon.spell=="Empty":
			ricon.modulate=Color(1,1,1)
		else:
			ricon.modulate=Color(0.7,0.7,0.7)
	else:
		licon.modulate=Color(1,1,1)
		ricon.modulate=Color(1,1,1)
	if get_node("../Inventory").spellbook.size()>=2:
		get_node("SpellbookCover").modulate=get_node("../Inventory").spellbook[2][1]
	if pages.size()<page:
		page=pages.size()
	if page==0 and pages.is_empty()==false:
		page=1
	if get_node("../Inventory").spellbook.size()>=3:
		pages=get_node("../Inventory").spellbook[2][3]
	else:
		pages = []
	if pages.size()>0:
		get_node("SpellSelector").visible=true
	if page%2==1:
		get_node("SpellSelector").position.x=-20
		if pages.size()>0:
			if licon.spell!=pages[page-1]:
				remove_child(licon)
				licon = spellicon.instantiate()
				licon.spell = pages[page-1]
				licon.page=0
				licon.position=get_node("PageL").position
				add_child(licon)
		else:
			if licon.spell!="Empty":
				remove_child(licon)
				licon = spellicon.instantiate()
				licon.spell = "Empty"
				licon.page=0
				licon.position=get_node("PageL").position
				add_child(licon)
		if pages.size()>page:
			if ricon.spell!=pages[page]:
				remove_child(ricon)
				ricon = spellicon.instantiate()
				ricon.spell = pages[page]
				ricon.page=1
				ricon.position=get_node("PageR").position
				add_child(ricon)
		else:
			if ricon.spell!="Empty":
				remove_child(ricon)
				ricon = spellicon.instantiate()
				ricon.spell = "Empty"
				ricon.page=1
				ricon.position=get_node("PageR").position
				add_child(ricon)
	elif page!=0:
		get_node("SpellSelector").position.x=10
		if ricon.spell!=pages[page-1]:
			remove_child(ricon)
			ricon = spellicon.instantiate()
			ricon.spell = pages[page-1]
			ricon.page=1
			ricon.position=get_node("PageR").position
			add_child(ricon)
		if licon.spell!=pages[page-2]:
			remove_child(licon)
			licon = spellicon.instantiate()
			licon.spell = pages[page-2]
			licon.page=0
			licon.position=get_node("PageL").position
			add_child(licon)
	if Input.is_action_just_pressed("spell_previous"):
		if page > 1:
			page -=1
	if Input.is_action_just_pressed("spell_next"):
		if page < pages.size() and pages.size()>1:
			page +=1
