extends Node2D

var player_pos = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("Ysortedthings/Inside").visible=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if get_node("Ysortedthings/player"):
		player_pos = get_node("Ysortedthings/player").global_position


func _on_collisonstopfailing_body_entered(body: Node2D) -> void:
	print(body.Name) # Replace with function body.
