extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocitat = Vector2(300,300)

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(500,300)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	position += velocitat * delta #delta són els segons que han passat
	rotation_degrees += 100 * delta


	if position.x >= 975 or position.x <= 50:
		velocitat.x *= -1
	if position.y >= 550:
		position.y = 550
		velocitat.y *= -1
	if position.y <= 0:
		position.y = 0
		velocitat.y *= -1
