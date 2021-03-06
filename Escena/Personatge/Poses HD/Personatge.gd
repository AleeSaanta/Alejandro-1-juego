extends KinematicBody2D


var velocitat_base = 200
var direccio = Vector2.DOWN
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var velocitat_salt = -620


func _physics_process(delta):
	velocitat += gravetat * delta
	velocitat = move_and_slide(velocitat, Vector2.UP)
	
	velocitat.x = 0
	velocitat += gravetat * delta
	if Input.is_action_pressed("dreta"):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed("esquerra"):
		velocitat += Vector2.LEFT * velocitat_base
	if Input.is_action_just_pressed("adalt") and is_on_floor():
		velocitat.y = velocitat_salt
	velocitat = move_and_slide(velocitat, Vector2.UP)
	anima(velocitat)
	
func anima(velocitat):
	if velocitat.x > 0:
		$AnimatedSprite.play("corre")
		$AnimatedSprite.flip_h = false
	elif velocitat.x < 0:
		$AnimatedSprite.play("corre")
		$AnimatedSprite.flip_h = true
		
	if abs(velocitat.x) < 0.1:
		$AnimatedSprite.play("quiet")
		
	if velocitat.y < 0:
		$AnimatedSprite.play("salta")



func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://Escena/Pantalla1.tscn")
	
	

func _on_Muertepantalla1_body_entered(body):
	get_tree().change_scene("res://Escena/Pantalla1.tscn")



func _on_Final_body_entered(body):
	get_tree().change_scene("res://Escena/Pantalla2.tscn")
