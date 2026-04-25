extends Area2D
@export var spawnRadius = 10
@export var Inventory_item: PackedScene
@export var just_thrown=false
@export var named = "Spellbook"
var attract = false
var player_dist_x = 0
var player_dist_y = 0
var player_dist = 0
var velocity_x = 0
var velocity_y = 0
var physical = true
var donehere = false
var capacity = 0
var spells = []
var color = Color(1,1,1)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	color = get_node("..").color
	named = get_node("..").named
	spells = get_node("..").spells
	capacity = get_node("..").capacity
	velocity_x=get_node("..").velx
	velocity_y=get_node("..").vely
	just_thrown = get_node("..").just_thrown
	print(get_node("/root/Game/Ysortedthings/player").global_position.x)
	if get_node("..").generic == "generic":
		self.visible=true
		physical=true
	else:
		self.visible=false
		physical=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_node("CollisionShape2D").set_deferred("disabled",!self.visible)
	physical=self.visible
	get_node("Book").modulate = color
	if just_thrown == true:
		await get_tree().create_timer(3).timeout
		just_thrown=false
	if physical == true:
		player_dist_x = get_node("/root/Game/Ysortedthings/player").global_position.x-self.global_position.x
		player_dist_y = get_node("/root/Game/Ysortedthings/player").global_position.y-self.global_position.y
		player_dist = sqrt(pow(player_dist_x,2)+pow(player_dist_y,2))
		if player_dist<=30 and player_dist !=0 and just_thrown==false:
			attract=true
			velocity_x = player_dist_x/player_dist/3
			velocity_y = player_dist_y/player_dist/3
		if player_dist>40:
			if attract==true:
				velocity_x = 0
				velocity_y = 0
				attract = false
			just_thrown=false
		if attract==false:
			velocity_x*=0.9
			velocity_y*=0.9
			if velocity_x <=0.05:
				velocity_x=0
			if velocity_x <=0.05:
				velocity_x=0
		if player_dist>1000:
			queue_free()
		global_position.x+=velocity_x
		global_position.y+=velocity_y
		player_dist_x = get_node("/root/Game/Ysortedthings/player").global_position.x-self.global_position.x
		player_dist_y = get_node("/root/Game/Ysortedthings/player").global_position.y-self.global_position.y
		player_dist = sqrt(pow(player_dist_x,2)+pow(player_dist_y,2))
		if player_dist<5 and just_thrown==false:
			for i in get_node("/root/Game/World/GUI/Inventory_things/Inventory").hotbar.size():
				if get_node("/root/Game/World/GUI/Inventory_things/Inventory").hotbar[i]=="" and donehere==false:
					get_node("/root/Game/World/GUI/Inventory_things/Inventory").hotbar[i]=named
					get_node("/root/Game/World/GUI/Inventory_things/Inventory").hotbarlimit[i]=1
					get_node("/root/Game/World/GUI/Inventory_things/Inventory").hotbaralpha[i]=color
					get_node("/root/Game/World/GUI/Inventory_things/Inventory").hotbarnumber[i]=1
					get_node("/root/Game/World/GUI/Inventory_things/Inventory").hotbardata[i]=["Spellbook","Spellbook",spells]
					donehere=true
					queue_free()
			for i in get_node("/root/Game/World/GUI/Inventory_things/Inventory").twentyfive.size():
				if get_node("/root/Game/World/GUI/Inventory_things/Inventory").twentyfive[i]=="" and donehere==false:
					get_node("/root/Game/World/GUI/Inventory_things/Inventory").twentyfive[i]=named
					get_node("/root/Game/World/GUI/Inventory_things/Inventory").twentyfivelimit[i]=1
					get_node("/root/Game/World/GUI/Inventory_things/Inventory").twentyfivealpha[i]=color
					get_node("/root/Game/World/GUI/Inventory_things/Inventory").twentyfivenumber[i]=1
					get_node("/root/Game/World/GUI/Inventory_things/Inventory").twentyfivedata[i]=["Spellbook","Spellbook",spells]
					donehere=true
					queue_free()
			if donehere==true:
				get_node("/root/Game/World/GUI/Inventory_things/Inventory/Pickup").play()
	else:
		queue_free()
