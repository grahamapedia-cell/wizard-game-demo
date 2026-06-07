extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_node("..").visible==false:
		get_node("CollisionShape2D").set_deferred("disabled",true)
	else:
		get_node("CollisionShape2D").set_deferred("disabled",false)


func _on_body_entered(body: Node2D) -> void:
	if body.has_signal("cast"):
		if get_node("/root/titlescreen/Game/World/Area").area_time==false:
				get_node("/root/titlescreen/Game/World/Area").area_time=true
				get_node("/root/titlescreen/Game/World/Area").leaving="Inside"
				get_node("/root/titlescreen/Game/World/Area").entering="Outside"
				get_node("/root/titlescreen/Game/World/Area").xpos=0
				get_node("/root/titlescreen/Game/World/Area").ypos=60
				print("door")
