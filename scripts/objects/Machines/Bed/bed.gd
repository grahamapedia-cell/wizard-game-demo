extends RigidBody2D
var mousein = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_node("..").visible==false:
		get_node("CollisionShape2D").set_deferred("disabled",true)
	else:
		get_node("CollisionShape2D").set_deferred("disabled",false)
	if Input.is_action_just_pressed("use_item") and mousein==true and get_node("/root/titlescreen/Game/World/GUI/Inventory_things/Inventory").visible==false:
		get_node("/root/titlescreen/Game/World/GUI/Daycounter").frames=0
		get_node("/root/titlescreen/Game/World/GUI/Daycounter").hourhand=24*12
		get_node("/root/titlescreen/Game/World/GUI/Daycounter").hoursdone=0
		get_node("/root/titlescreen/Game/World/Time").day+=1

func _on_mouse_entered() -> void:
	mousein=true
	print("mousein") # Replace with function body.


func _on_mouse_exited() -> void:
	mousein=false
