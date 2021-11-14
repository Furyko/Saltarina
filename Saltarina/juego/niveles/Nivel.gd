extends Node

signal abrir_portal()

export var menu_game_over = "res://juego/menus/MenuGameOver.tscn"
export var nivel_actual = ""

var numero_llaves_zanahoria = 0
var contenedor_llaves


func _ready():
# warning-ignore:return_value_discarded
	DatosPlayer.connect("game_over", self, "game_over")
	contenedor_llaves = get_node_or_null("Zanahorias")
	if contenedor_llaves != null:
		numero_llaves_nivel()


func numero_llaves_nivel():
	numero_llaves_zanahoria = contenedor_llaves.get_child_count()
	DatosPlayer.contabilizar_llaves(numero_llaves_zanahoria)
	for llave in  contenedor_llaves.get_children():
		llave.connect("consumido", self, "llaves_restantes")


func llaves_restantes():
	numero_llaves_zanahoria -= 1
	if numero_llaves_zanahoria == 0:
		emit_signal("abrir_portal")


func game_over():
	DatosPlayer.nivel_actual = nivel_actual
# warning-ignore:return_value_discarded
	get_tree().change_scene(menu_game_over)
