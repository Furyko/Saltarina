extends Control

export var proxima_escena =  ""

onready var nubes = $ParallaxBackground/ParallaxNubesLejanas


func _ready():
	DatosPlayer.reset()


func _process(_delta):
	nubes.global_position.x -= 3


func _on_BotonIniciar_pressed():
	MusicaGlobal.replay()
# warning-ignore:return_value_discarded
	get_tree().change_scene(proxima_escena)
