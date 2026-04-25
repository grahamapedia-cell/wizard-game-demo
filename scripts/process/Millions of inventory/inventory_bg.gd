extends Area2D
@export var throwaway = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible=false # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.visible=get_node("../Inventory").visible
	self.input_pickable=self.visible


func _on_mouse_entered() -> void:
	throwaway = true # Replace with function body.



func _on_mouse_exited() -> void:
	throwaway=false # Replace with function body.
