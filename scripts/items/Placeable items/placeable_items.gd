extends Node2D
@export var category = ""
@export var itemtype = ""
@export var quantity = 1
@export var spawnRadius = 10
@export var physical = false
@export var just_thrown = false
@export var velx = 0
@export var vely = 0
@export var data = ["Placeable Items","Name/Type",["Subcategory",Color(1,1,1),0]]
# More data is typically: Subcategory, Element, a number (like how much essence a crop makes), color, and a related item name.
# I should clean this up.
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if physical == false:
		position.x+=randf_range(-spawnRadius,spawnRadius)
		position.y+=randf_range(-spawnRadius,spawnRadius)
	print(itemtype)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
