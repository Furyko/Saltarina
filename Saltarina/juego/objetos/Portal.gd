extends Area2D

export var proximo_nivel = ""

var esta_activado = false


func _ready():
# warning-ignore:return_value_discarded
	get_parent().connect("abrir_portal", self, "play_animacion")


func _on_body_entered(_body):
	if esta_activado:
		_body.play_entrar_portal(global_position)
		yield(get_tree().create_timer(1.0), "timeout")
		cambiar_nivel()


func cambiar_nivel():
# warning-ignore:return_value_discarded
	get_tree().change_scene(proximo_nivel)


func play_animacion():
	esta_activado = true
	$AudioActivarPortal.play()
	$AnimatedSprite.play("default")
	$AnimationPlayer.play("activado")
