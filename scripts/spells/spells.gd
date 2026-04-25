extends Node2D
var selected_type = "Typeless"
var selected_spell = ""
var currentlyCasting = false
var go = false
var mouse_position
var distx = 0
var disty = 0
var dist = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(self.get_path()) # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	mouse_position = get_global_mouse_position()
	distx=mouse_position.x-self.global_position.x
	disty=mouse_position.y-self.global_position.y
	dist=sqrt(pow(distx,2)+pow(disty,2))
	if get_node("/root/Game/World/GUI/Inventory_things/Spellbook").pages.is_empty()==true:
		selected_spell=""
	else:
		selected_spell=get_node("/root/Game/World/GUI/Inventory_things/Spellbook").pages[get_node("/root/Game/World/GUI/Inventory_things/Spellbook").page-1]





func _on_player_cast() -> void:
	if currentlyCasting == false and selected_spell!="":
		go=true
