extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocitat = Vector2(300,300)
var direccio = Vector2(0, 0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass #position = Vector2(500,300)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	direccio = Vector2(0,0)
	if Input.is_action_pressed("dreta"):
		direccio += Vector2(1,0)
	if Input.is_action_pressed("esquerra"):
		direccio += Vector2(-1,0)
	if Input.is_action_pressed("abaix"):
		direccio += Vector2(0,1)
	if Input.is_action_pressed("adalt"):
		direccio += Vector2(0,-1)
	position += direccio.normalized() * velocitat * delta #delta són els segons que han passat
	


func _on_Personatge_area_entered(area):
	if area.name == "Zona":
		modulate = Color(1, 0, 0)
	elif area.name == "Zona2":
		modulate = Color(1, 0, 1)
	area.modulate = Color(0, 1, 0)


func _on_Personatge_area_exited(area):
	modulate = Color(1, 1 , 1)
	area.modulate = Color(1, 1, 1)
