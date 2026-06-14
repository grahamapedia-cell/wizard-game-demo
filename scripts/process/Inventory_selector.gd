extends Sprite2D
@export var hotbar = false
@export var type = ""
@export var title = -1
@export var gone = true
@export var input = true
var path = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.visible = get_node("../Inventory").visible


func _on_spellbook_slot_mouse_exited() -> void:
	path=""
	hide()
	type=""
	title=-1


func _on_spellbook_slot_mouse_entered() -> void:
	self.position=get_node("../Equiphell/SpellbookSlot").position
	show()
	type="Spellbook"
	hotbar=false
	title=0
