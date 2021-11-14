extends Area2D

export(String, "oro", "plata", "bronce") var tipo_moneda

onready var animacion = $AnimatedSprite
onready var animacion_consumir = $AnimationPlayer
onready var colision_presonaje = $ColisionPersonaje


func _ready():
	animacion.play()


func _on_body_entered(_body):
	DatosPlayer.sumar_monedas(tipo_moneda)
	colision_presonaje.set_deferred("disabled", true)
	animacion_consumir.play("consumir")
