extends Node2D
@export var category = ""
@export var itemtype = ""
@export var quantity = 1
@export var spawnRadius = 10
@export var physical = false
@export var just_thrown = false
@export var velx = 0
@export var vely = 0
@export var data = ["Materials","Name/Type",["More data"]]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if physical == false:
		position.x+=randf_range(-spawnRadius,spawnRadius)
		position.y+=randf_range(-spawnRadius,spawnRadius)
	print(itemtype)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func save():
	var save_dict = {
		"filename": get_scene_file_path(),
		"parent": get_parent().get_path(),
		"pos_x": position.x,
		"pos_y": position.y,
		"data": data
		}
	return save_dict
