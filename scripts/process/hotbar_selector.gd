extends Sprite2D
var slot = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x=-114
	show() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Hotbar_1"):
		position.x=-114
		slot=0
	if Input.is_action_just_pressed("Hotbar_2"):
		position.x=-95
		slot=1
	if Input.is_action_just_pressed("Hotbar_3"):
		position.x=-76
		slot=2
	if Input.is_action_just_pressed("Hotbar_4"):
		position.x=-57
		slot=3
	if Input.is_action_just_pressed("Hotbar_5"):
		position.x=-38
		slot=4
	if Input.is_action_just_pressed("Hotbar_6"):
		position.x=-19
		slot=5
	if Input.is_action_just_pressed("Hotbar_7"):
		position.x=0
		slot=6
	if Input.is_action_just_pressed("Hotbar_8"):
		position.x=19
		slot=7
	if Input.is_action_just_pressed("Hotbar_9"):
		position.x=38
		slot=8
