extends Sprite2D
#array: [0 none, 1 hotbar, 2 inventory, 3 charms, 4 rings, 5 potions, 6 spellbooks]
@onready var inventory = []
@onready var hotbar = [[],[],[],[],[],[],[],[],[]]
@onready var hotbarnumber = [0,0,0,0,0,0,0,0,0]
@onready var twentyfive = [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]]
@onready var twentyfivenumber = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
@onready var charms = [[],[],[]]
@onready var charmsfull = [false,false,false]
@onready var rings = [[],[]]
@onready var ringsfull = [false,false]
@onready var hat = []
@onready var hatfull = false
@onready var robes = []
@onready var robesfull = false
@onready var spellbook = []
@onready var spellbookfull = false
@onready var quantity = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	print(self.get_path()) # Replace with function body.
	print(get_scene_file_path())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	inventory = [0,hotbar,twentyfive,charms,rings,hat,robes,spellbook]
	quantity = [0,hotbarnumber,twentyfivenumber,charmsfull,ringsfull,hatfull,robesfull,spellbookfull]
	if Input.is_action_just_pressed("test_inventory"):
		print(inventory)
		print(quantity)
		print(hotbar[0])
	if Input.is_action_just_pressed("open_inventory"):
		self.visible = !self.visible

func save():
	print("inventory")
	var save_dict = {
		"filename": get_scene_file_path(),
		"parent": get_parent().get_path(),
		"pos_x": position.x,
		"pos_y": position.y,
		"hotbar": hotbar,
		"hotbarnumber": hotbarnumber,
		"twentyfive": twentyfive,
		"twentyfivenumber": twentyfivenumber,
		"charms": charms,
		"charmsfull": charmsfull,
		"rings": rings,
		"ringsfull": ringsfull,
		"hat": hat,
		"hatfull": hatfull,
		"robes": robes,
		"robesfull": robesfull,
		"spellbook": spellbook,
		"spellbookfull": spellbookfull
		}
	return save_dict
