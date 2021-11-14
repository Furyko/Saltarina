extends KinematicBody2D

export var velocidad = 100.0

var gravedad = 800.0
var movimiento = Vector2.ZERO

onready var animacion = $AnimatedSprite
onready var detector_de_vacio = $DetectorDeVacio
onready var detector_de_pared  = $DetectorDePared


func _physics_process(_delta):
	caer()
	caminar()
# warning-ignore:return_value_discarded
	move_and_slide(movimiento, Vector2.UP)


func caer():
	if not is_on_floor():
		movimiento.y = gravedad


func caminar():
	if not animacion.is_playing():
		animacion.play("caminar")
	detectar_colision()
	movimiento.x = velocidad


func detectar_colision():
	if not detector_de_vacio.is_colliding() or detector_de_pared.is_colliding():
		velocidad  *= -1
		detector_de_vacio.position.x *= -1
		detector_de_pared.scale *= -1
		detector_de_pared.position.x *= -1
		animar(animacion.flip_h)


func animar(valor_actual):
	animacion.flip_h = !valor_actual


func _on_DetectorJugador_body_entered(body):
	body.respawn()
