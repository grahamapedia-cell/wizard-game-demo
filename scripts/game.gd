extends Node2D
@export var loading = false
var paths = []

var player_pos = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused=true
	if loading==true:
		await load_game()
	get_tree().paused=false
	get_node("Ysortedthings/Inside").visible=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if get_node("Ysortedthings/player"):
		player_pos = get_node("Ysortedthings/player").global_position


func _on_collisonstopfailing_body_entered(body: Node2D) -> void:
	print(body.Name) # Replace with function body.

func save_game():
	var save_file=FileAccess.open("user://savegame.save",FileAccess.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	#var node_data=get_node("/root/titlescreen/Game/World/GUI/Inventory_things/Inventory").call("save")
	#var json_string=JSON.stringify(node_data)
	#save_file.store_line(json_string)
	for node in save_nodes:
		if node.scene_file_path.is_empty():
			print(%s)
			continue
		if !node.has_method("save"):
			print("The following node must be given a save function:")
			print(%s)
			continue
		var node_data=node.call("save")
		var json_string=JSON.stringify(node_data)
		save_file.store_line(json_string)

func load_game():
	if not FileAccess.file_exists("user://savegame.save"):
		return
	#don't clone things!
	var save_nodes=get_tree().get_nodes_in_group("Persist")
	#for j in save_nodes:
		#paths.push_back(j.get_path())
#	var CountTheRice=0
	for i in save_nodes:
		i.queue_free()
		i.name="Qwertyuiop"
	#	if get_node_or_null(paths[CountTheRice])!=null:
	#		i.free()
#		CountTheRice+=1
	#paths=[]
	var save_file=FileAccess.open("user://savegame.save", FileAccess.READ)
	while save_file.get_position()<save_file.get_length():
		var json_string = save_file.get_line()
		var json=JSON.new()
		var parse_result=json.parse(json_string)
		if not parse_result==OK:
			print(json.get_error_message(),": found at ", json_string, " at line ", json.get_error_line())
			continue
		var node_data=json.data
		var new_object = load(node_data["filename"]).instantiate()
		print(node_data["filename"])
		get_node(node_data["parent"]).add_child(new_object)
		new_object.position = Vector2(node_data["pos_x"],node_data["pos_y"])
		for i in node_data.keys():
			if i=="filename" or i=="parent" or i=="pos_x" or i=="pos_y":
				continue
			new_object.set(i,node_data[i])
		print(new_object.get_path())
