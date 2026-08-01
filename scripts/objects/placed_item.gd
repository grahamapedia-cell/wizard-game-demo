extends Node2D
@export var data = ["Type","Name",["Subcategory",Color(1,1,1),"Element"]]
var days=0
var grown=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func save():
	var save_dict={
		"filename": get_scene_file_path(),
		"parent": get_parent().get_path(),
		"pos_x": position.x,
		"pos_y": position.y,
		"data": data,
		"days": days,
		"grown": grown
	}
	return save_dict
