extends Control


func _ready():
	$PanelPuntaje/Puntaje.text = "Puntaje: {p}".format({"p":DatosPlayer.generar_puntaje()})


func _on_BotonMenuPrincipal_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://juego/menus/MenuPrincipal.tscn")
