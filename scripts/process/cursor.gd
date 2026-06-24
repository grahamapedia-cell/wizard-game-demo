extends Node2D
@export var amount: PackedScene
@export var killswitch = true
@export var materials: PackedScene
@export var spellbooks: PackedScene
@export var placeables: PackedScene
@export var place: PackedScene
@export var letter: PackedScene
var text
var object
var path
var num
var mousestore=[]
var mousestorenumber=0
var sparestore=[]
var sparestorenumber=0
var distx = 0
var disty = 0
var dist = 0
var drop
var title = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#title is easier to type than get_node... all that.
	title=get_node("../Inventory_things/Inventory_Selector").title
	path=str(get_node("../Inventory_things/Inventory_Selector").path)
	#Following the mouse baybee!
	var mouse_position = get_global_mouse_position()
	self.global_position=mouse_position
	#For some reason the cursor controls whether the hologram of the placeable item is visible.
	if get_node("../Inventory_things/Inventory_Selector").hotbar==true:
		if title>=0:
			if get_node("../Inventory_things/Inventory").hotbarnumber[title]>0:
				text=letter.instantiate()
				text.type="Inventory"
				text.text=get_node("../Inventory_things/Inventory").hotbar[title][1]
				add_child(text)
	else:
		if title>=0:
			if get_node("../Inventory_things/Inventory").twentyfivenumber[title]>0:
				text=letter.instantiate()
				text.type="Inventory"
				text.text=get_node("../Inventory_things/Inventory").twentyfive[title][1]
				add_child(text)
	if get_node("../Inventory_things/Inventory").hotbar[get_node("../Inventory_things/Hotbar_Selector").slot].is_empty()==false:
		if get_node("../Inventory_things/Inventory").visible==false and get_node("../Inventory_things/Inventory").hotbar[get_node("../Inventory_things/Hotbar_Selector").slot][0]=="Placeables":
			get_node("/root/titlescreen/Game/Ysortedthings/player/PlaceHologram").visible=true
		else:
			get_node("/root/titlescreen/Game/Ysortedthings/player/PlaceHologram").visible=false
	else:
		get_node("/root/titlescreen/Game/Ysortedthings/player/PlaceHologram").visible=false
	#Making the sprite of the held item show up! Also the numbers
	if mousestore.size()>=2:
			if mousestore[2][0]=="Essence":
				get_node("./AnimatedSprite2D").animation = "Potion"
				get_node("./AnimatedSprite2D").modulate = mousestore[2][1]
				get_node("./Alphaless").animation = "bottle"
			elif mousestore[2][0]=="Spellbook":
				get_node("./AnimatedSprite2D").animation = "Spellbook"
				get_node("./AnimatedSprite2D").modulate = mousestore[2][1]
				get_node("./Alphaless").animation = "pages"
			elif mousestore[2][0]=="Scroll":
				get_node("./AnimatedSprite2D").animation = "Scroll"
				get_node("./AnimatedSprite2D").modulate = mousestore[2][1]
				get_node("./Alphaless").animation = "paper"
			elif mousestore[2][0]=="Seeds":
				get_node("./AnimatedSprite2D").animation = "Seeds"
				get_node("./AnimatedSprite2D").modulate = mousestore[2][1]
				get_node("./Alphaless").animation = "empty"
			elif get_node("./AnimatedSprite2D").sprite_frames.has_animation(mousestore[1]):
				get_node("./AnimatedSprite2D").animation = mousestore[1]
				get_node("./Alphaless").animation = "empty"
				get_node("./AnimatedSprite2D").modulate = mousestore[2][1]
	if mousestorenumber >= 2:
		killswitch=true
		num = amount.instantiate()
		num.type="Inventory"
		num.position.x=8
		num.position.y=6.5
		num.number=mousestorenumber
		add_child(num)
	elif mousestorenumber==0:
		get_node("./AnimatedSprite2D").animation = "empty"
		get_node("./Alphaless").animation = "empty"
	#If you close your inventory, drop the item you're moving.
	if Input.is_action_just_pressed("open_inventory") and mousestore!=[]:
		if mousestore[0]=="Materials":
			distx = get_viewport().get_mouse_position().x
			disty = get_viewport().get_mouse_position().y
			dist = sqrt(pow(distx,2)+pow(disty,2))
			drop = materials.instantiate()
			drop.just_thrown=true
			drop.quantity=mousestorenumber
			drop.data=mousestore
			drop.position.x=get_node("/root/titlescreen/Game/Ysortedthings/player").position.x
			drop.position.y=get_node("/root/titlescreen/Game/Ysortedthings/player").position.y
			if dist == 0:
				drop.velx=0
				drop.vely=0
			else:
				drop.velx=distx/dist
				drop.vely=disty/dist
			add_sibling(drop)
		#Spellbooks and placeable items have different scenes for them so we need to instantiate different scenes.
		elif mousestore[0]=="Spellbooks":
			distx = get_viewport().get_mouse_position().x
			disty = get_viewport().get_mouse_position().y
			dist = sqrt(pow(distx,2)+pow(disty,2))
			drop = spellbooks.instantiate()
			drop.just_thrown=true
			drop.quantity=mousestorenumber
			drop.data=mousestore
			drop.position.x=get_node("/root/titlescreen/Game/Ysortedthings/player").position.x
			drop.position.y=get_node("/root/titlescreen/Game/Ysortedthings/player").position.y
			if dist == 0:
				drop.velx=0
				drop.vely=0
			else:
				drop.velx=distx/dist
				drop.vely=disty/dist
			add_sibling(drop)
		elif mousestore[0]=="Placeables":
			distx = get_viewport().get_mouse_position().x
			disty = get_viewport().get_mouse_position().y
			dist = sqrt(pow(distx,2)+pow(disty,2))
			drop = placeables.instantiate()
			drop.just_thrown=true
			drop.quantity=mousestorenumber
			drop.data=mousestore
			drop.position.x=get_node("/root/titlescreen/Game/Ysortedthings/player").position.x
			drop.position.y=get_node("/root/titlescreen/Game/Ysortedthings/player").position.y
			if dist == 0:
				drop.velx=0
				drop.vely=0
			else:
				drop.velx=distx/dist
				drop.vely=disty/dist
			add_sibling(drop)
		mousestorenumber=0
		mousestore=[]
	#Transferring items!
	if Input.is_action_just_pressed("cast_spell"):
		if get_node("../Inventory_things/Inventory").visible==true and title>=0:
			if get_node("../Inventory_things/Inventory_Selector").hotbar==true:
				if get_node("../Inventory_things/Inventory").hotbar[title]==mousestore:
					if get_node("../Inventory_things/Inventory").hotbarnumber[title]+mousestorenumber<=999:
						get_node("../Inventory_things/Inventory").hotbarnumber[title] += mousestorenumber
						mousestorenumber=0
						mousestore=[]
					else:
						mousestorenumber-=(999-get_node("../Inventory_things/Inventory").hotbarnumber[title])
						get_node("../Inventory_things/Inventory").hotbarnumber[title]=999
				else:
					sparestore=get_node("../Inventory_things/Inventory").hotbar[title]
					sparestorenumber=get_node("../Inventory_things/Inventory").hotbarnumber[title]
					get_node("../Inventory_things/Inventory").hotbar[title]=mousestore
					get_node("../Inventory_things/Inventory").hotbarnumber[title]=mousestorenumber
					mousestore=sparestore
					mousestorenumber=sparestorenumber
					sparestore=[]
					sparestorenumber=0
			else:
				if path!="":
					#this is for getting things to and from the popup windows
					if get_node("../Inventory_things/Inventory_Selector").type=="Crops":
						if mousestorenumber==0 or mousestore[2][0]=="Crops":
							if mousestore==get_node(path).inventory[title]:
								if get_node(path).inventorynumber[title]<999:
									if get_node(path).inventorynumber[title]+mousestorenumber>999:
										mousestorenumber-=(999-get_node(path).inventorynumber[title])
										get_node(path).inventorynumber[title]=999
									else:
										get_node(path).inventorynumber[title]+=mousestorenumber
										mousestorenumber=0
										mousestore=[]
							else:
								sparestore=get_node(path).inventory[title]
								sparestorenumber=get_node(path).inventorynumber[title]
								get_node(path).inventory[title]=mousestore
								get_node(path).inventorynumber[title]=mousestorenumber
								mousestore = sparestore
								mousestorenumber = sparestorenumber
								sparestore = []
								sparestorenumber = 0
					elif get_node("../Inventory_things/Inventory_Selector").type=="Essence":
						if mousestorenumber==0 or mousestore.size()>=3:
							if mousestorenumber==0 or mousestore[2][0]=="Essence":
								if mousestore==get_node(path).inventory[title]:
									if get_node(path).inventorynumber[title]<999:
										if get_node(path).inventorynumber[title]+mousestorenumber>999:
											mousestorenumber-=(999-get_node(path).inventorynumber[title])
											get_node(path).inventorynumber[title]=999
										else:
											get_node(path).inventorynumber[title]+=mousestorenumber
											mousestorenumber=0
											mousestore=[]
								else:
									sparestore=get_node(path).inventory[title]
									sparestorenumber=get_node(path).inventorynumber[title]
									get_node(path).inventory[title]=mousestore
									get_node(path).inventorynumber[title]=mousestorenumber
									mousestore = sparestore
									mousestorenumber = sparestorenumber
									sparestore = []
									sparestorenumber = 0
					elif get_node("../Inventory_things/Inventory_Selector").type=="Output":
						if mousestorenumber==0:
							mousestore=get_node(path).inventory[title]
							mousestorenumber=get_node(path).inventorynumber[title]
							get_node(path).inventory[title]=[]
							get_node(path).inventorynumber[title]=0
						elif mousestore==get_node(path).inventory[title]:
							if mousestorenumber<get_node(path).itemlimit[title]:
								if get_node(path).inventorynumber[title]+mousestorenumber>get_node(path).itemlimit[title]:
										get_node(path).inventorynumber[title]-=(get_node(path).itemlimit[title]-mousestorenumber)
										mousestorenumber=get_node(path).itemlimit[title]
								else:
									mousestorenumber+=get_node(path).inventorynumber[title]
									get_node(path).inventory[title]=[]
									get_node(path).inventorynumber[title]=0
				elif get_node("../Inventory_things/Inventory_Selector").type=="Spellbook":
					if mousestorenumber==0 or mousestore[0]=="Spellbooks":
						sparestore=get_node("../Inventory_things/Inventory").spellbook
						sparestorenumber=int(get_node("../Inventory_things/Inventory").spellbookfull)
						get_node("../Inventory_things/Inventory").spellbook=mousestore
						get_node("../Inventory_things/Inventory").spellbookfull=bool(mousestorenumber)
						mousestore = sparestore
						mousestorenumber = sparestorenumber
						sparestore = []
						sparestorenumber = 0
						get_node("../Inventory_things/Spellbook").killswitch=true
						get_node("../Inventory_things/Spellbook").page=1
				elif get_node("../Inventory_things/Inventory").twentyfive[title]==mousestore:
					get_node("../Inventory_things/Inventory").twentyfivenumber[title] += mousestorenumber
					#COME BACK LATER TO MAKE IT STOP WITH THE INVENTORY CAP
					mousestorenumber=0
					mousestore=[]
				else:
					sparestore=get_node("../Inventory_things/Inventory").twentyfive[title]
					sparestorenumber=get_node("../Inventory_things/Inventory").twentyfivenumber[title]
					get_node("../Inventory_things/Inventory").twentyfive[title]=mousestore
					get_node("../Inventory_things/Inventory").twentyfivenumber[title]=mousestorenumber
					mousestore=sparestore
					mousestorenumber=sparestorenumber
					sparestore=[]
					sparestorenumber=0
		elif get_node("../Inventory_things/Inventory").visible==true and get_node("../Inventory_things/InventoryBG").throwaway==true and mousestore != []:
			if mousestore[0]=="Materials":
				var distx = get_viewport().get_mouse_position().x
				var disty = get_viewport().get_mouse_position().y
				var dist = sqrt(pow(distx,2)+pow(disty,2))
				drop = materials.instantiate()
				drop.just_thrown=true
				drop.quantity=mousestorenumber
				drop.data=mousestore
				drop.position.x=get_node("/root/titlescreen/Game/Ysortedthings/player").position.x
				drop.position.y=get_node("/root/titlescreen/Game/Ysortedthings/player").position.y
				if dist == 0:
					drop.velx=0
					drop.vely=0
				else:
					drop.velx=distx/dist
					drop.vely=disty/dist
				add_sibling(drop)
			elif mousestore[0]=="Spellbooks":
				distx = get_viewport().get_mouse_position().x
				disty = get_viewport().get_mouse_position().y
				dist = sqrt(pow(distx,2)+pow(disty,2))
				drop = spellbooks.instantiate()
				drop.just_thrown=true
				drop.quantity=mousestorenumber
				drop.data = mousestore
				drop.position.x=get_node("/root/titlescreen/Game/Ysortedthings/player").position.x
				drop.position.y=get_node("/root/titlescreen/Game/Ysortedthings/player").position.y
				if dist == 0:
					drop.velx=0
					drop.vely=0
				else:
					drop.velx=distx/dist
					drop.vely=disty/dist
				add_sibling(drop)
			elif mousestore[0]=="Placeables":
				distx = get_viewport().get_mouse_position().x
				disty = get_viewport().get_mouse_position().y
				dist = sqrt(pow(distx,2)+pow(disty,2))
				drop = placeables.instantiate()
				drop.just_thrown=true
				drop.quantity=mousestorenumber
				drop.data=mousestore
				drop.position.x=get_node("/root/titlescreen/Game/Ysortedthings/player").position.x
				drop.position.y=get_node("/root/titlescreen/Game/Ysortedthings/player").position.y
				if dist == 0:
					drop.velx=0
					drop.vely=0
				else:
					drop.velx=distx/dist
					drop.vely=disty/dist
				add_sibling(drop)
			mousestorenumber=0
			mousestore=[]
	if Input.is_action_just_pressed("use_item"):
		if get_node("../Inventory_things/Inventory").visible==true and title>=0:
			print("uh oh")
			if get_node("../Inventory_things/Inventory_Selector").hotbar==true:
				if get_node("../Inventory_things/Inventory").hotbar[title]==mousestore or get_node("../Inventory_things/Inventory").hotbar[title]==[]:
					get_node("../Inventory_things/Inventory").hotbar[title]=mousestore
					get_node("../Inventory_things/Inventory").hotbarnumber[title]+=int(ceil(float(mousestorenumber)/2))
					mousestorenumber=floor(mousestorenumber/2)
					if mousestorenumber==0:
						mousestore=[]
			else:
				if get_node("../Inventory_things/Inventory").twentyfive[title]==mousestore or get_node("../Inventory_things/Inventory").twentyfive[title]==[]:
					get_node("../Inventory_things/Inventory").twentyfive[title]=mousestore
					get_node("../Inventory_things/Inventory").twentyfivenumber[title]+=int(ceil(float(mousestorenumber)/2))
					mousestorenumber=floor(mousestorenumber/2)
					if mousestorenumber==0:
						mousestore=[]
		elif get_node("/root/titlescreen/Game/Ysortedthings/player/PlaceHologram").visible==true and get_node("/root/titlescreen/Game/Ysortedthings/player/PlaceHologram").dist/16<3:
			object=place.instantiate()
			object.data=get_node("../Inventory_things/Inventory").hotbar[get_node("../Inventory_things/Hotbar_Selector").slot]
			object.global_position.x=get_node("/root/titlescreen/Game/Ysortedthings/player/PlaceHologram").global_position.x
			object.global_position.y=4+get_node("/root/titlescreen/Game/Ysortedthings/player/PlaceHologram").global_position.y
			get_node("/root/titlescreen/Game/Ysortedthings/"+str(get_node("../../Area").entering)).add_child(object)
			get_node("../Inventory_things/Inventory").hotbarnumber[get_node("../Inventory_things/Hotbar_Selector").slot]-=1
			if get_node("../Inventory_things/Inventory").hotbarnumber[get_node("../Inventory_things/Hotbar_Selector").slot]<=0:
				get_node("../Inventory_things/Inventory").hotbarnumber[get_node("../Inventory_things/Hotbar_Selector").slot]=0
				get_node("../Inventory_things/Inventory").hotbar[get_node("../Inventory_things/Hotbar_Selector").slot]=[]
